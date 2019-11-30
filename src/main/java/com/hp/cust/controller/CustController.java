package com.hp.cust.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.hp.blogs.service.BlogsService;
import com.hp.code.beans.RegiterCode;
import com.hp.code.service.RegiterCodeService;
import com.hp.cust.beans.Cust;
import com.hp.cust.service.CustService;
import com.hp.integral.beans.RechargeCust;
import com.hp.integral.service.RechargeCustService;
import com.hp.order.service.OrderService;
import com.hp.technician.service.TechnicianService;
import com.hp.utils.AnalysisKeyWordsListUtils;
import com.hp.utils.Msg;

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
	
	@Autowired
	private RechargeCustService rechargeSer;	//充值
	
	@Autowired
	private TechnicianService technSer;		//技师
	
	@Autowired
	private OrderService orderSer;			//订单
	
	@Autowired
	private BlogsService blogSer;			//博客
	
	
	/**
	 * 查询客户数量
	 * */
	@RequestMapping(value="/getCountsByShow",method=RequestMethod.GET)
	@ResponseBody
	public HashMap<String, Integer> getCustsByShow() {
		int technsCount = technSer.selectCount(null);
		int custsCount = custSer.selectCount(null);
		int blogsCount = blogSer.selectCount(null);
		int ordersCount = orderSer.selectCount(null);
		HashMap<String, Integer> map = new HashMap<>();
		map.put("technsCount", technsCount);
		map.put("custsCount", custsCount);
		map.put("blogsCount", blogsCount);
		map.put("ordersCount", ordersCount);
		return map;
	}
	
	
	/**
	 * 根据id查询客户
	 * */
	@RequestMapping(value="/getById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getById(@PathVariable("id")Integer id) {
		Cust cust = custSer.selectById(id);
		return Msg.success().add("cust", cust);
	}
	
	/**
	 * 忘记密码
	 * */
	@RequestMapping(value="/forgetPwd",method=RequestMethod.POST)
	@ResponseBody
	public Msg forgetPwd(@RequestBody Map o) {
		String email = (String) o.get("email");
		String code = (String) o.get("code");
		String pwd = (String) o.get("changePwd");
		EntityWrapper<RegiterCode> codeWra = new EntityWrapper<>();
		codeWra.eq("regiter_email", email).eq("code", code);
		int count = regiterCodeSer.selectCount(codeWra);
		if(count == 0) {
			return Msg.fail().add("msg","验证码错误！");
		}
		regiterCodeSer.delete(codeWra);
		Cust entity = new Cust();
		entity.setCustPassword(pwd);
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_email", email);
		boolean b = custSer.update(entity, wrapper);
		if(b) {
			return Msg.success().add("msg","修改成功！请登录！");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	
	/**
	 * 修改资料
	 * */
	@RequestMapping(value="/changeCustInfo",method=RequestMethod.POST)
	public String changeCustInfo(Cust cust,HttpServletRequest req) {
		//验证两次输入的密码
		if(!cust.getFormPwd1().equals(cust.getFormPwd2())) {
			req.getSession().setAttribute("error", "两次密码不一致！");
			return "redirect:/cust/getCustInfo/"+cust.getCustId()+"/"+cust.getCustName();
		}
		//验证邮箱
		EntityWrapper<RegiterCode> codeWrapper = new EntityWrapper<>();
		codeWrapper.eq("regiter_email", cust.getCustEmail())
					.eq("code", cust.getFormCode());
		int count = regiterCodeSer.selectCount(codeWrapper);
		if(count == 0) {
			req.getSession().setAttribute("error", "验证码有误！");
			return "redirect:/cust/getCustInfo/"+cust.getCustId()+"/"+cust.getCustName();
		}
		//删除对应邮箱验证码
		regiterCodeSer.delete(codeWrapper);
		Cust entity = new Cust();
		if(!cust.getFormPwd2().equals("")) {
			entity.setCustPassword(cust.getFormPwd2());
		}
		entity.setCustId(cust.getCustId());
		if(!cust.getCustNick().equals("")) {
			entity.setCustNick(cust.getCustNick());
		}
		boolean b = custSer.updateById(entity);
		if(b) {
			return "redirect:/cust/loginOut";
		}else {
			req.getSession().setAttribute("error", "修改失败！");
			return "redirect:/cust/getCustInfo/"+cust.getCustId()+"/"+cust.getCustName();
		}
	}
	/**
	 * 充值
	 * */
	@RequestMapping(value="/recharge",method=RequestMethod.GET)
	@ResponseBody
	public Msg recharge(@RequestParam("id")Integer id,@RequestParam("integral")Integer integral
			,@RequestParam("money")Integer money) {
		Cust cust = custSer.selectById(id);
		Integer old = cust.getCustIntegral();
		Cust entity = new Cust();
		entity.setCustId(id);
		entity.setCustIntegral(old+integral);
		RechargeCust recharge = new RechargeCust();
		recharge.setRechargeCustId(id);
		recharge.setRechargeState("100");
		recharge.setOldIntegral(old);
		recharge.setRechargeIntegral(integral);
		recharge.setNewIntegral(old+integral);
		recharge.setRechargeMoney(money);
		rechargeSer.insert(recharge);		//充值记录
		boolean b = custSer.updateById(entity);
		if(!b) {
			return Msg.fail().add("msg","充值失败！");
		}
		return Msg.success().add("msg", "充值成功！");
	}
	
	/**
	 * 修改资料前的回显
	 * */
	@RequestMapping(value="/getCustInfo/{id}/{name}",method=RequestMethod.GET)
	public String getCustInfo(@PathVariable Integer id,@PathVariable String name,Model model) {
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_id", id).eq("cust_name", name);
		Cust cust = custSer.selectOne(wrapper);
		if(cust == null) {
			model.addAttribute("error", "未查询到客户信息！");
			return "forward:/pages/cust-info.jsp";
		}
		model.addAttribute("cust", cust);
		return "forward:/pages/cust-info.jsp";
	}
	
	/**
	 * 退出登录
	 * */
	@RequestMapping(value="/loginOut",method=RequestMethod.GET)
	public String loginOut(HttpServletRequest req) {
		req.getSession().invalidate();
		return "redirect:/pages/index.jsp";
	}
	
	/**
	 * 登录
	 * */
	@RequestMapping(value="/loginInto",method=RequestMethod.POST)
	public String loginInto(Cust cust,HttpServletRequest req) {
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_password",cust.getCustPassword())
		.andNew()
		.eq("cust_email", cust.getFormCode())
		.or()
		.eq("cust_name",  cust.getFormCode());
		Cust one = custSer.selectOne(wrapper);
		if(one==null) {
			req.getSession().setAttribute("error", "用户名或密码错误");
			return "redirect:/pages/login.jsp";	
		}
		System.out.println(one);
		req.getSession().setAttribute("nick", one.getCustNick());
		req.getSession().setAttribute("id", one.getCustId());
		req.getSession().setAttribute("name", one.getCustName());
		req.getSession().setAttribute("flag", 1);
		return "redirect:/pages/index.jsp";
	}
	
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delCustByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delCustByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = custSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	
	/**
	 * 得到所有的客户
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getCustList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getCustList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String name = (String) afterMap.get("custName");
		String email = (String) afterMap.get("custEmail");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		String min_integral = (String) afterMap.get("min_integral");
		String max_integral = (String) afterMap.get("max_integral");
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!name.equals("")) {
			wrapper.like("cust_name", name);
		}
		if(!email.equals("")) {
			wrapper.like("cust_email", email);
		}
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate);
		}
		if(!min_integral.equals("") && !max_integral.equals("")) {
			int min = Integer.parseInt(min_integral);
			int max = Integer.parseInt(max_integral);
			wrapper.between("cust_integral", min, max);
		}
		Page<Map<String, Object>> mapsPage = custSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有客户");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}

	/**
	 *	添加用户 
	 * */
	@RequestMapping(value="/addCust",method=RequestMethod.POST)
	@ResponseBody
	public Msg addCust(@RequestBody Map map) {
		String name = (String) map.get("custName");
		String email = (String) map.get("custEmail");
		//验证用户名或者邮箱是否已经存在
		boolean orNot = repeatOrNot(name,email);
		if(orNot) {
			return Msg.fail().add("msg","邮箱或用户名已经被注册！");
		}
		Cust entity = new Cust();
		entity.setCustEmail(email);
		entity.setCustName(name);
		entity.setCustIntegral(0);
		entity.setCustNick("新用户_"+name);
		entity.setCustPassword("123456");
		boolean b = custSer.insert(entity);
		if(!b) {
			return Msg.fail().add("msg","添加失败！");
		}
		return Msg.success().add("msg", "添加成功");
	}
	
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
		//验证用户名或者邮箱是否已经存在
		boolean orNot = repeatOrNot(cust.getCustName(),cust.getCustEmail());
		if(orNot) {
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
		entity.setCustIntegral(0);
		entity.setCustNick(cust.getCustNick());
		boolean b = custSer.insert(entity);
		if(b) {
			return "redirect:/pages/login.jsp";
		}else {
			req.getSession().setAttribute("error", "注册失败！");
			return "redirect:/pages/cust-regiter.jsp";
		}
	}
	//=============页面跳转===============
	
	/**
	 * 抽取方法，验证用户名和邮箱是否存在
	 * true 存在
	 * false 不存在	
	 * @return 
	 */
	public boolean repeatOrNot(String name,String email) {
		EntityWrapper<Cust> getCustWrapper = new EntityWrapper<>();
		getCustWrapper.eq("cust_email", email).orNew()
						.eq("cust_name", name);
		int count2 = custSer.selectCount(getCustWrapper);
		if(count2 != 0) {
			return true;
		}
		return false;
	}
	//去往添加客户界面
	@RequestMapping(value="/toAddCustPage",method=RequestMethod.GET)
	public String toAddCustPage() {
		return "/custs/add-cust";
	}
	@RequestMapping(value="/toListCustPage",method=RequestMethod.GET)
	public String toListCustPage() {
		return "/custs/list-cust";
	}
}

