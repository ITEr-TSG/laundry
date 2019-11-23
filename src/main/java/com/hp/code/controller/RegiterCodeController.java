package com.hp.code.controller;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.hp.code.beans.RegiterCode;
import com.hp.code.service.RegiterCodeService;
import com.hp.utils.EmailUntils;
import com.hp.utils.Msg;
import com.hp.utils.RandomUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-22
 */
@Controller
@RequestMapping("/regiterCode")
public class RegiterCodeController {

	@Autowired
	private RegiterCodeService regiterCodeSer;
	
	@RequestMapping(value="/createEmailCode",method=RequestMethod.GET)
	@ResponseBody
	public Msg createEmailCode(@RequestParam("regEmail")String email) {
		EntityWrapper<RegiterCode> regiterWrapper = new EntityWrapper<>();
		
		regiterWrapper.eq("regiter_email", email);
		int count = regiterCodeSer.selectCount(regiterWrapper);
		if(count != 0) {
			regiterCodeSer.delete(regiterWrapper);
		}
		String code = RandomUtils.makeRandom();
		boolean c = EmailUntils.sendEmail(email,code);
		if(c) {
			RegiterCode entity = new RegiterCode();
			entity.setCode(code);
			entity.setRegiterEmail(email);
			boolean b = regiterCodeSer.insert(entity);
			if(b) {
				return Msg.success().add("msg", "发送成功！注意查收！");
			}else {
				return Msg.fail().add("msg", "发送失败！");
			}
		}else {
			return Msg.fail().add("msg","验证码获取失败！");
		}
	}
}

