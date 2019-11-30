package com.hp.order.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.hp.cust.beans.Cust;
import com.hp.cust.service.CustService;
import com.hp.order.beans.Order;
import com.hp.order.beans.OrderItem;
import com.hp.order.service.OrderItemService;
import com.hp.order.service.OrderService;
import com.hp.technician.beans.Technician;
import com.hp.technician.service.TechnicianService;
import com.hp.utils.AnalysisKeyWordsListUtils;
import com.hp.utils.EmailUntils;
import com.hp.utils.Msg;
import com.hp.utils.UUIDUtil;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-30
 */
@Controller
@RequestMapping("/orders")
public class OrderController {

	@Autowired
	private OrderItemService orderItemSer;		//订单条目
	
	@Autowired
	private TechnicianService technSer;		//技师
	
	@Autowired
	private CustService custSer;		//顾客
	
	@Autowired
	private OrderService orderSer;
	
	/**
	 * 客户查询订单
	 * @return 
	 * */
	@RequestMapping(value="/getOrdersListByCust",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getOrdersListByCust(@RequestBody Map map) {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) map.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		EntityWrapper<Order> wrapper = new EntityWrapper<>();
		String orderNum = (String) afterMap.get("orderNumber");
		if(!orderNum.equals("")) {
			wrapper.eq("order_number",orderNum);
		}
		String custName = (String) afterMap.get("custName");
		wrapper.eq("cust_name",custName);
		String custId = (String) afterMap.get("custId");
		Integer cuid = Integer.parseInt(custId);
		wrapper.eq("cust_id",cuid);
		Page<Map<String, Object>> mapsPage = orderSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有订单");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	/**
	 * 包月到期
	 * */
	@RequestMapping(value="/expireOrder/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg expireOrder(@PathVariable("id")Integer id) {
		Order order = orderSer.selectById(id);
		if(!order.getState().equals("已下单")) {
			return Msg.fail().add("msg","账号已经是到期状态！");
		}
		Date overTime = order.getOverTime();
		Date date = new Date();
		if(overTime.getTime()>date.getTime()) {
			return Msg.fail().add("msg","账号还未到到期时间！不可操作！");
		}
		order.setState("已完成");
		boolean b = orderSer.updateById(order);
		EmailUntils untils = new EmailUntils();
		untils.expireOrder(order.getEmail(), order.getOrderNumber());
		if(b) {
			return Msg.success().add("msg","修改成功");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	
	/**
	 * 修改订单状态
	 * */
	@RequestMapping(value="/editState/{id}/{state}",method=RequestMethod.GET)
	@ResponseBody
	public Msg editState(@PathVariable("id")Integer id,@PathVariable("state")String state) {
		Order order = orderSer.selectById(id);
		String oldState = order.getState();
		if(oldState.equals("已下单")&&state.equals("提货中")) {
			order.setState(state);
		}else if(oldState.equals("提货中")&&state.equals("已提货")) {
			order.setState(state);
		}else if(oldState.equals("服务完")&&state.equals("配送中")) {
			order.setState(state);
		}else {
			return Msg.fail().add("msg","修改失败！状态不符合修改条件！请等待用户操作！");
		}
		order.setOrderId(id);
		boolean b = orderSer.updateById(order);
		if(b) {
			return Msg.success().add("msg","修改成功");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	/**
	 * 修改订单状态
	 * */
	@RequestMapping(value="/editStateByCust/{id}/{state}",method=RequestMethod.GET)
	@ResponseBody
	public Msg editStateByCust(@PathVariable("id")Integer id,@PathVariable("state")Integer state) {
		Order order = orderSer.selectById(id);
		String oldState = order.getState();
		if(oldState.equals("配送中")&&state==1) {
			order.setState("已完成");
		}else {
			return Msg.fail().add("msg","修改失败！状态不符合修改条件！请等待用户操作！");
		}
		order.setOrderId(id);
		boolean b = orderSer.updateById(order);
		if(b) {
			return Msg.success().add("msg","修改成功");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	
	/**
	 * 修改
	 * */
	@RequestMapping(value="/editOrder",method=RequestMethod.POST)
	@ResponseBody
	public Msg editItem(@RequestBody Map map) {
		System.out.println(map);
		String technId = (String) map.get("technId");
		String orderId = (String) map.get("orderId");
		String address = (String) map.get("address");
		String shopper = (String) map.get("shopper");
		String email = (String) map.get("email");
		Integer teId = Integer.parseInt(technId);
		Integer orId = Integer.parseInt(orderId);
		Technician technician = technSer.selectById(teId);
		Order o = new Order();
		o.setTechnId(teId);
		o.setTechnName(technician.getTechnRealName());
		o.setOrderId(orId);
		o.setAddress(address);
		o.setEmail(email);
		o.setShopper(shopper);
		boolean b = orderSer.updateById(o);
		if(b) {
			return Msg.success().add("msg","修改成功");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	
	/**
	 * 批量删除
	 * */
	@RequestMapping(value="/delOrdersByIds",method=RequestMethod.POST)
	@ResponseBody
	public Msg delCustByIds(@RequestBody ArrayList<Integer> list) {
		boolean b = orderSer.deleteBatchIds(list);
		if(!b) {
			return Msg.fail().add("msg","删除失败！");
		}
		return Msg.success().add("msg", "删除成功");
	}
	
	/**
	 * 后台获取普通订单
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getGeneralOrderList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getGeneralOrderList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String itemId = (String) afterMap.get("itemId");
		String state = (String) afterMap.get("state");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		String kwText = (String) afterMap.get("kwText");
		EntityWrapper<Order> wrapper = new EntityWrapper<>();
		if(!kwText.equals("")) {
			wrapper.like("order_number",kwText).or().like("cust_name",kwText)
			.or().like("techn_name",kwText)
			.or().like("shopper",kwText)
			.or().like("address",kwText)
			.or().like("email",kwText)
			.or().like("item_name",kwText);
		}
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("appoint_time", startDate, endDate);
		}
		if(!itemId.equals("0")) {
			Integer iteId = Integer.parseInt(itemId);
			wrapper.eq("item_id",iteId);
		}
		if(!state.equals("0")) {
			wrapper.eq("state",state);
		}
		wrapper.eq("item_sort","单次");
		Page<Map<String, Object>> mapsPage = orderSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有普通订单");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 后台获取普通订单
	 * @return 
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/getMonthOrderList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getMonthOrderList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String itemId = (String) afterMap.get("itemId");
		String state = (String) afterMap.get("state");
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		String kwText = (String) afterMap.get("kwText");
		EntityWrapper<Order> wrapper = new EntityWrapper<>();
		if(!kwText.equals("")) {
			wrapper.like("order_number",kwText).or().like("cust_name",kwText)
			.or().like("techn_name",kwText)
			.or().like("shopper",kwText)
			.or().like("address",kwText)
			.or().like("email",kwText)
			.or().like("item_name",kwText);
		}
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("appoint_time", startDate, endDate);
		}
		if(!itemId.equals("0")) {
			Integer iteId = Integer.parseInt(itemId);
			wrapper.eq("item_id",iteId);
		}
		if(!state.equals("0")) {
			wrapper.eq("state",state);
		}
		wrapper.eq("item_sort","包月");
		Page<Map<String, Object>> mapsPage = orderSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有普通订单");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	
	/**
	 * 顾客下单
	 * @throws ParseException 
	 * */
	@RequestMapping(value="/addOrder",method=RequestMethod.POST)
	@ResponseBody
	public Msg addOrder(@RequestBody Map map) throws ParseException {
		Order order = new Order();
		String technId = (String) map.get("technId");
		String itemName = (String) map.get("itemName");
		order.setItemName(itemName);
		if(technId.equals("")) {
			return Msg.fail().add("msg","请选择技师！");
		}
		String itemId = (String) map.get("itemId");
		Integer iteId = Integer.parseInt(itemId);
		String custId = (String) map.get("custId");
		Integer cuid = Integer.parseInt(custId);
		if(iteId==1) {
			EntityWrapper<Order> wrapper = new EntityWrapper<>();
			wrapper.eq("cust_id",cuid);
			int count = orderSer.selectCount(wrapper);
			if(count!=0) {
				return Msg.fail().add("msg","您的账号已经体验过了！");
			}
		}
		Integer tecId = Integer.parseInt(technId);
		Technician technician = technSer.selectById(tecId);
		order.setTechnId(tecId);
		order.setTechnName(technician.getTechnRealName());
		
		String price = (String) map.get("price");
		Integer pri = Integer.parseInt(price);
		order.setPrice(pri);
		Cust cust = custSer.selectById(cuid);
		//更新客户的积分
		Integer old = cust.getCustIntegral();
		if(old-pri<0) {
			return Msg.fail().add("msg","您的积分不足！请您充值！");
		}
		cust.setCustIntegral(old-pri);
		custSer.updateById(cust);
		//发邮件提示客户消费了多少钱
		EmailUntils untils = new EmailUntils();
		untils.addOrder(cust.getCustEmail(), itemName, pri, old-pri);
		order.setCustId(cuid);
		order.setCustName(cust.getCustName());
		order.setItemId(iteId);
		String shopper = (String) map.get("shopper");
		order.setShopper(shopper);
		String address = (String) map.get("address");
		order.setAddress(address);
		String email = (String) map.get("email");
		order.setEmail(email);
		String appointTime = (String) map.get("appointTime");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = sdf.parse(appointTime);
		String itemSort = (String) map.get("itemSort");
		order.setItemSort(itemSort);
		order.setAppointTime(date); 
		if(itemSort.equals("包月")) {
			Date overTime = getAfterMonth();
			order.setOverTime(overTime);
		}
		order.setState("已下单");
		order.setOrderNumber(UUIDUtil.createUUID());
		boolean b = orderSer.insert(order);
		if(b) {
			return Msg.success().add("msg","下单成功");
		}
		return Msg.fail().add("msg","下单失败！");
	}
	//获取当前时间一个月后的时间
	private Date getAfterMonth() {
		Date now = new Date();
		Date startDate = DateUtils.addDays(now, +30);
		return startDate;
	}

	//==========页面跳转===========
	
	/**
	 * 得到客户的订单
	 * */
	@RequestMapping(value="/getMyOrders/{id}/{name}",method=RequestMethod.GET)
	public String getMyOrders(@PathVariable("id")Integer id,
			@PathVariable("name")String custName,Model model) {
		EntityWrapper<Cust> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_id",id).eq("cust_name",custName);
		Cust one = custSer.selectOne(wrapper);
		model.addAttribute("custId",one.getCustId());
		model.addAttribute("custName",one.getCustName());
		return "forward:/pages/orders/list-orders.jsp";
	}
	//去往下单界面
	@RequestMapping(value="/toAddOrderPage/{id}",method=RequestMethod.GET)
	public String toAddOrderPage(@PathVariable("id")Integer id,Model model) {
		EntityWrapper<OrderItem> wrapper = new EntityWrapper<>();
		wrapper.eq("item_id", id).eq("item_state","展示");
		OrderItem orderItem =orderItemSer.selectOne(wrapper);
		if(orderItem==null) {
			model.addAttribute("itemError", "未查询到该订单！");
			return "forward:/pages/orders/add-order.jsp";
		}
		model.addAttribute("itemId", orderItem.getItemId());
		model.addAttribute("itemName", orderItem.getItemName());
		model.addAttribute("itemSort", orderItem.getItemSort());
		model.addAttribute("orderPrice", orderItem.getItemPrice());
		return "forward:/pages/orders/add-order.jsp";
	}
	//普通订单列表
	@RequestMapping(value="/toGeneralOrdersListPage",method=RequestMethod.GET)
	public String toGeneralOrdersListPage() {
		return "/orders/list-general-orders";
	}
	
	//包月订单列表
	@RequestMapping(value="/toMonthOrdersListPage",method=RequestMethod.GET)
	public String toMonthOrdersListPage() {
		return "/orders/list-month-orders";
	}
	
}

