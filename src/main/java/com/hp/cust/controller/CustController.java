package com.hp.cust.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.hp.code.beans.RegiterCode;
import com.hp.code.service.RegiterCodeService;
import com.hp.cust.beans.Cust;
import com.hp.cust.service.CustService;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-22
 */
@Controller
@RequestMapping("/cust")
public class CustController {
	
	@Autowired
	private RegiterCodeService regiterCodeSer;	//验证码
	
	@Autowired
	private CustService custSer;		//客户
	
	/**
	 * 用户注册
	 * */
	@RequestMapping(value="/regiterCust",method=RequestMethod.POST)
	public String regiterCust(Cust cust,HttpServletRequest req) {
		//验证两次输入的密码
		if(!cust.getFormPwd1().equals(cust.getFormPwd2())) {
			req.getSession().setAttribute("error", "两次密码不一致！");
			return "redirect:/pages/cust-regiter.jsp";
		}
		//验证用户名和邮箱是否已经存在
		EntityWrapper<Cust> getCustWrapper = new EntityWrapper<>();
		getCustWrapper.eq("cust_email", cust.getCustEmail()).orNew()
						.eq("cust_name", cust.getCustName());
		int count2 = custSer.selectCount(getCustWrapper);
		if(count2 != 0) {
			req.getSession().setAttribute("error", "用户名已经存在或邮箱已经被注册！");
			return "redirect:/pages/cust-regiter.jsp";
		}
		//验证邮箱
		EntityWrapper<RegiterCode> codeWrapper = new EntityWrapper<>();
		codeWrapper.eq("regiter_email", cust.getCustEmail())
					.eq("code", cust.getFormCode());
		int count = regiterCodeSer.selectCount(codeWrapper);
		if(count == 0) {
			req.getSession().setAttribute("error", "验证码有误！");
			return "redirect:/pages/cust-regiter.jsp";
		}
		//删除对应邮箱验证码
		regiterCodeSer.delete(codeWrapper);
		//注册
		Cust entity = new Cust();
		entity.setCustPassword(cust.getFormPwd2());
		entity.setCustName(cust.getCustName());
		entity.setCustEmail(cust.getCustEmail());
		boolean b = custSer.insert(entity);
		if(b) {
			return "redirect:/pages/login.jsp";
		}else {
			req.getSession().setAttribute("error", "注册失败！");
			return "redirect:/pages/cust-regiter.jsp";
		}
	}
	
	
}

