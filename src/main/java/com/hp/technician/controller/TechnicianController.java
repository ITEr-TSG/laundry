package com.hp.technician.controller;


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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.hp.code.beans.RegiterCode;
import com.hp.code.service.RegiterCodeService;
import com.hp.technician.beans.TechnMidSort;
import com.hp.technician.beans.Technician;
import com.hp.technician.service.TechnMidSortService;
import com.hp.technician.service.TechnicianService;
import com.hp.utils.AnalysisKeyWordsListUtils;
import com.hp.utils.EmailUntils;
import com.hp.utils.Msg;
import com.hp.utils.UploadFileUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-24
 */
@Controller
@RequestMapping("/technician")
public class TechnicianController {
	/**
	 * 文件保存的路径
	 */
	public static final String SAVE_PATH = "D:\\laundry\\technician";

	@Autowired
	private TechnicianService technSer;
	
	@Autowired
	private RegiterCodeService regiterCodeSer;	//验证码
	
	@Autowired
	private TechnMidSortService midSer;			//中间表
	
	
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delTechnByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delCustByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = technSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	/**
	 * 批量审核
	 * */
	@RequestMapping(value="/passTechnByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg passTechnByIds(@RequestBody ArrayList<Integer> list) {
		List<Technician> selectBatchIds = technSer.selectBatchIds(list);
		String[] email = new String[selectBatchIds.size()];
		for (int i = 0; i < selectBatchIds.size(); i++) {
			String state = selectBatchIds.get(i).getTechnState();
			if(!state.equals("待审核")) {		//判断选中的技师中是否有非待审核状态的
				return Msg.fail().add("msg","选中的技师中有非待审核状态！");
			}
			email[i]=selectBatchIds.get(i).getTechnEmail();
			selectBatchIds.get(i).setTechnState("已通过");
		}
		boolean c = EmailUntils.sendEmails(email,"success");//这里有问题，应当记录发送失败的邮箱进行失败回调
		boolean b = technSer.updateBatchById(selectBatchIds);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	/**
	 * 批量审核
	 * */
	@RequestMapping(value="/rejectTechnByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg rejectTechnByIds(@RequestBody ArrayList<Integer> list) {
		List<Technician> selectBatchIds = technSer.selectBatchIds(list);
		String[] email = new String[selectBatchIds.size()];
		for (int i = 0; i < selectBatchIds.size(); i++) {
			String state = selectBatchIds.get(i).getTechnState();
			if(!state.equals("待审核")) {		//判断选中的技师中是否有非待审核状态的
				return Msg.fail().add("msg","选中的技师中有非待审核状态！");
			}
			email[i]=selectBatchIds.get(i).getTechnEmail();
			selectBatchIds.get(i).setTechnState("已驳回");
		}
		boolean c = EmailUntils.sendEmails(email,"false");//这里有问题，应当记录发送失败的邮箱进行失败回调
		boolean b = technSer.updateBatchById(selectBatchIds);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	
	
	
	/**
	 * 得到所有技师
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getTechnList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTechnList(@RequestBody Map map) throws ParseException {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) map.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String name = (String) afterMap.get("name");
		String email = (String) afterMap.get("email");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		String min_integral = (String) afterMap.get("min_integral");
		String max_integral = (String) afterMap.get("max_integral");
		String technState = (String) afterMap.get("technState");
		EntityWrapper<Technician> wrapper = new EntityWrapper<>();
		List<Integer> sortIds = (List) afterMap.get("sortId");
		if(!sortIds.isEmpty()) {
			EntityWrapper<TechnMidSort> midWrapper = new EntityWrapper<>();
			midWrapper.in("sort_id", sortIds);
			//查询中间表
			List<TechnMidSort> list = midSer.selectList(midWrapper);
			ArrayList<Integer> technIds = new ArrayList<>();
			for (TechnMidSort technMidSort : list) {
				technIds.add(technMidSort.getTechnId());
			}
			wrapper.in("technician_id",technIds);
		}
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!name.equals("")) {
			wrapper.like("techn_real_name", name);
		}
		if(!technState.equals("0")) {
			wrapper.eq("techn_state", technState);
		}
		if(!email.equals("")) {
			wrapper.like("techn_email", email);
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate);
		}
		if(!min_integral.equals("") && !max_integral.equals("")) {
			int min = Integer.parseInt(min_integral);
			int max = Integer.parseInt(max_integral);
			wrapper.between("techn_integral", min, max);
		}
		Page<Map<String, Object>> selectMapsPage = technSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有客户");
		resultMap.put("total",selectMapsPage.getTotal());
		resultMap.put("data",selectMapsPage.getRecords());
		return resultMap;
		
	}
	
	
	/**
	 * 注册
	 * */
	@RequestMapping(value="/regiter",method=RequestMethod.POST)
	@ResponseBody
	public Msg regiter(Technician techn) {
		System.out.println(techn);
		//验证两次输入的密码
		if(!techn.getFormPwd1().equals(techn.getFormPwd2())) {
			return Msg.fail().add("msg","两次密码不一致！");
		}
		//验证用户名或者邮箱是否已经存在
		boolean orNot = repeatOrNot(techn.getTechnRealName(),techn.getTechnEmail());
		if(orNot) {
		  return Msg.fail().add("msg","您已经注册了！");
		}
		//验证邮箱
		EntityWrapper<RegiterCode> codeWrapper = new EntityWrapper<>();
		codeWrapper.eq("regiter_email", techn.getTechnEmail())
					.eq("code", techn.getFormCode());
		int count = regiterCodeSer.selectCount(codeWrapper);
		if(count == 0) {
			return Msg.fail().add("msg","验证码有误！");
		}
		//删除对应邮箱验证码
		regiterCodeSer.delete(codeWrapper);
		Technician entity = new Technician();
		entity.setTechnEmail(techn.getTechnEmail());
		entity.setTechnNick(techn.getTechnNick());
		entity.setTechnPassword(techn.getFormPwd2());
		entity.setTechnPhone(techn.getTechnPhone());
		entity.setTechnPhoto(techn.getTechnPhoto());
		entity.setTechnRealName(techn.getTechnRealName());
		entity.setTechnRemarks(techn.getTechnRemarks());
		entity.setTechnIntegral(0);
		boolean b = technSer.insert(entity);
		if(b) {
			return Msg.success().add("msg","注册成功！请您耐心等待管理人员审核！");
		}
		return Msg.fail().add("msg","注册失败！");
	}
	

	/**
	 * 上传图片
	 * @return 
	 * */
	@RequestMapping(value="/uploadNewFoodImg",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadNewFoodImg(@RequestParam("file") CommonsMultipartFile file) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = UploadFileUtil.uploadFile(file, SAVE_PATH);
		if(result.equals("error")) {
			resultMap.put("code", 1);
			resultMap.put("msg", "图片上传失败");
			return resultMap;	
		}
		String technician = "/file/technician/"+result;
		resultMap.put("code", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", technician);
		return resultMap;
	}
	//==========抽取的方法===============
	/**
	 * 去往添加技师页面
	 * */
	
	/**
	 * 抽取方法，验证真实姓名和邮箱是否存在
	 * true 存在
	 * false 不存在
	 * */
	private boolean repeatOrNot(String technRealName, String technEmail) {
		EntityWrapper<Technician> getTechnicianWrapper = new EntityWrapper<>();
		getTechnicianWrapper.eq("techn_email", technEmail).orNew()
						.eq("techn_real_name", technRealName);
		int count2 = technSer.selectCount(getTechnicianWrapper);
		if(count2 != 0) {
			return true;
		}
		return false;
	}
	@RequestMapping(value="/toTechnListPage",method=RequestMethod.GET)
	public String toTechnListPage() {
		return "/technician/list-techn";
	}
	
}

