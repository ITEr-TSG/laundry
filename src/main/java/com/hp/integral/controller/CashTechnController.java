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
import com.hp.integral.beans.CashTechn;
import com.hp.integral.service.CashTechnService;
import com.hp.technician.beans.Technician;
import com.hp.technician.service.TechnicianService;
import com.hp.utils.AnalysisKeyWordsListUtils;
import com.hp.utils.EmailUntils;
import com.hp.utils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-27
 */
@Controller
@RequestMapping("/cashTechn")
public class CashTechnController {

	@Autowired
	private CashTechnService cashTechnSer;	//提现表
	
	@Autowired
	private TechnicianService technService;		//技师表
	
	@Autowired
	private CashTechnService cashSer;
	
	/**
	 * 同意提现
	 * */
	@RequestMapping(value="/agreeCash",method=RequestMethod.POST)
	@ResponseBody
	public Msg agreeCash(@RequestBody Map map) {
		Integer technId = (Integer) map.get("technId");
		Technician technician = technService.selectById(technId);
		EmailUntils untils = new EmailUntils();
		untils.sendEmailsCurrency(technician.getTechnEmail(), "success", map);
		CashTechn cash = new CashTechn();
		Integer id = (Integer) map.get("cashId");
		cash.setCashId(id);
		cash.setCashState("200");
		boolean b = cashSer.updateById(cash);
		if(b) {
			return Msg.success().add("msg","成功！");
		}
		return Msg.fail().add("msg","失败！");
	}
	/**
	 * 驳回提现
	 * */
	@RequestMapping(value="/rejectCash",method=RequestMethod.POST)
	@ResponseBody
	public Msg rejectCash(@RequestBody Map map) {
		Integer technId = (Integer) map.get("technId");
		Integer cashIntegral = (Integer) map.get("cashIntegral");
		
		Technician technician = technService.selectById(technId);
		
		Integer old = technician.getTechnIntegral();	//得到技师的积分情况(避免技师接单了更新了积分)
		Technician errorTechn = new Technician();		//更新技师积分
		errorTechn.setTechnIntegral(old+cashIntegral);
		errorTechn.setTechnicianId(technId);
		boolean rollBACK = technService.updateById(errorTechn);	//对积分进行回滚
		if(!rollBACK) {
			return Msg.fail().add("msg", "操作失败！原因积分回滚失败！");
		}
		EmailUntils untils = new EmailUntils();
		untils.sendEmailsCurrency(technician.getTechnEmail(), "error", map);
		
		CashTechn cash = new CashTechn();
		Integer id = (Integer) map.get("cashId");
		cash.setCashId(id);
		cash.setCashState("300");
		boolean b = cashSer.updateById(cash);
		if(b) {
			return Msg.success().add("msg","成功！");
		}
		return Msg.fail().add("msg","失败！");
	}
	
	
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delCashByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delCustByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = cashSer.deleteBatchIds(list);
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
	@RequestMapping(value="/getCashList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTechnList(@RequestBody Map map) throws ParseException {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) map.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		EntityWrapper<CashTechn> wrapper = new EntityWrapper<>();
		String name = (String) afterMap.get("name");
		if(!name.equals("")) {
			List<Integer> technIds = getTechnId(name); //如果输入了技师名，通过技师名得到技师id
			wrapper.in("techn_id", technIds);
		}
		String cashAccount = (String) afterMap.get("cashAccount");
		if(!cashAccount.equals("")) {
			wrapper.like("cash_account", cashAccount);
		}
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		String min_integral = (String) afterMap.get("min_integral");
		String max_integral = (String) afterMap.get("max_integral");
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate);
		}
		if(!min_integral.equals("") && !max_integral.equals("")) {
			int min = Integer.parseInt(min_integral);
			int max = Integer.parseInt(max_integral);
			wrapper.between("cash_integral", min, max);
		}
		String cashWay = (String) afterMap.get("cashWay");
		if(!cashWay.equals("0")) {
			wrapper.eq("cash_way",cashWay);
		}
		String cashState = (String) afterMap.get("cashState");
		if(!cashState.equals("0")) {
			wrapper.eq("cash_state",cashState);
		}
		Page<Map<String, Object>> selectMapsPage = cashSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有提现信息");
		resultMap.put("total",selectMapsPage.getTotal());
		resultMap.put("data",selectMapsPage.getRecords());
		return resultMap;
	}
	
	
	
	private List<Integer> getTechnId(String name) {
		EntityWrapper<Technician> wrapper = new EntityWrapper<>();
		wrapper.like("techn_real_name", name);
		List<Technician> list = technService.selectList(wrapper);
		ArrayList<Integer> techIds = new ArrayList<>();
		for (Technician technician : list) {
			techIds.add(technician.getTechnicianId());
		}
		return techIds;
	}



	/**
	 * 提现
	 * */
	@RequestMapping(value="/cashIntegral",method=RequestMethod.POST)
	@ResponseBody
	public Msg cashIntegral(CashTechn cash) {
		if(cash.getCashWay().equals("0")) {
			return Msg.fail().add("msg", "请选择提现方式！");
		}
		Technician technician = technService.selectById(cash.getTechnId());
		int oldIntegral = cash.getOldIntegral();
		int cashIntegral = cash.getCashIntegral();
		int nowIntegral = oldIntegral-cashIntegral;
		if(nowIntegral<0) {
			return Msg.fail().add("msg", "提现积分超额！");
		}
		technician.setTechnIntegral(nowIntegral);
		technician.setTechnicianId(cash.getTechnId());
		technService.updateById(technician);
		
		cash.setCashState("100");
		boolean b = cashTechnSer.insert(cash);
		if(!b) {
			return Msg.fail().add("msg","提现失败！");
		}
		return Msg.success().add("msg", "提现成功！请您耐心等待工作人员的审核。");
	}
	
	//=================页面跳转======================
	@RequestMapping(value="/toTechnIntegralPage",method=RequestMethod.GET)
	public String toTechnIntegralPage() {
		return "/integral/cash-integral";
	}
	
}

