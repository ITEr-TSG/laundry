package com.hp.integral.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.hp.cust.beans.Cust;
import com.hp.cust.service.CustService;
import com.hp.integral.beans.CashTechn;
import com.hp.integral.beans.RechargeCust;
import com.hp.integral.service.RechargeCustService;
import com.hp.technician.beans.Technician;
import com.hp.utils.AnalysisKeyWordsListUtils;
import com.hp.utils.EmailUntils;
import com.hp.utils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-28
 */
@Controller
@RequestMapping("/rechargeCust")
public class RechargeCustController {
	
	@Autowired
	private RechargeCustService rechargeSer;		//充值积分
	
	@Autowired
	private CustService custSer;
	
	
	/**
	 * 驳回提现
	 * */
	@RequestMapping(value="/rejectRecharge",method=RequestMethod.POST)
	@ResponseBody
	public Msg rejectCash(@RequestBody Map map) {
		Integer custId = (Integer) map.get("rechargeCustId");
		Integer rechargeIntegral = (Integer) map.get("rechargeIntegral");
		Integer rechargeId = (Integer) map.get("rechargeId");
		
		Cust cust = custSer.selectById(custId);
		Integer old = cust.getCustIntegral();	//得到客户的积分情况(避免客户下单了更新了积分)
		Cust errorCust = new Cust();		//更新技师积分
		int rollBackIntegral = old-rechargeIntegral;
		errorCust.setCustIntegral(rollBackIntegral);
		errorCust.setCustId(custId);
		boolean rollBACK = custSer.updateById(errorCust);	//对积分进行回滚
		if(!rollBACK) {
			return Msg.fail().add("msg", "操作失败！原因积分回滚失败！");
		}
		EmailUntils untils = new EmailUntils();
		if(rollBackIntegral<0) {
			untils.sendEmailsRollBack(cust.getCustEmail(), "true", map,rollBackIntegral);
		}
		untils.sendEmailsRollBack(cust.getCustEmail(), "false", map,rollBackIntegral);
		RechargeCust rechargeCust = new RechargeCust();
		rechargeCust.setRechargeId(rechargeId);
		rechargeCust.setRechargeState("200");
		boolean b = rechargeSer.updateById(rechargeCust);
		if(b) {
			return Msg.success().add("msg","成功！");
		}
		return Msg.fail().add("msg","失败！");
	}
	
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delRechargeByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delCustByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = rechargeSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	
	
	
	/**
	 * 得到所有提现
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getRechargeList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getRechargeList(@RequestBody Map map) throws ParseException {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) map.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		EntityWrapper<RechargeCust> wrapper = new EntityWrapper<>();
		String name = (String) afterMap.get("name");
		if(!name.equals("")) {
			List<Integer> custIds = getCustId(name); //如果输入了客户名，通过客户名得到技师id
			wrapper.in("recharge_cust_id", custIds);
		}
		
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		String min_integral = (String) afterMap.get("min_integral");
		String max_integral = (String) afterMap.get("max_integral");
		String start_money = (String) afterMap.get("start_money");
		String end_money = (String) afterMap.get("end_money");
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate);
		}
		if(!min_integral.equals("") && !max_integral.equals("")) {
			int min = Integer.parseInt(min_integral);
			int max = Integer.parseInt(max_integral);
			wrapper.between("recharge_integral", min, max);
		}
		if(!start_money.equals("") && !end_money.equals("")) {
			int start = Integer.parseInt(start_money);
			int end = Integer.parseInt(end_money);
			wrapper.between("recharge_money", start, end);
		}
		String rechargeState = (String) afterMap.get("rechargeState");
		if(!rechargeState.equals("0")) {
			wrapper.eq("recharge_state",rechargeState);
		}
		Page<Map<String, Object>> selectMapsPage = rechargeSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有充值信息");
		resultMap.put("total",selectMapsPage.getTotal());
		resultMap.put("data",selectMapsPage.getRecords());
		return resultMap;
	}
	
	
	private List<Integer> getCustId(String name) {
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		wrapper.like("cust_name", name).or().like("cust_nick", name).or().like("cust_email", name);
		List<Cust> list = custSer.selectList(wrapper);
		ArrayList<Integer> custIds = new ArrayList<>();
		for (Cust cust : list) {
			custIds.add(cust.getCustId());
		}
		return custIds;
	}


	//=======页面跳转=========
	@RequestMapping(value="/toCustIntegralPage",method=RequestMethod.GET)
	public String toCustIntegralPage() {
		return "/integral/recharge-integral";
	}
	
}

