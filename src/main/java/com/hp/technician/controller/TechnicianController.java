package com.hp.technician.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import com.hp.cust.beans.Cust;
import com.hp.technician.beans.Technician;
import com.hp.technician.service.TechnicianService;
import com.hp.utils.AnalysisKeyWordsListUtils;
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

