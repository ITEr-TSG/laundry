package com.hp.order.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.hp.cust.beans.Cust;
import com.hp.order.beans.OrderItem;
import com.hp.order.service.OrderItemService;
import com.hp.utils.AnalysisKeyWordsListUtils;
import com.hp.utils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-29
 */
@Controller
@RequestMapping("/orderItem")
public class OrderItemController {

	@Autowired
	private OrderItemService orderItemSer;
	
	/**
	 * 修改状态
	 * */
	@RequestMapping(value="/changeState/{state}/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg changeState(@PathVariable("state")String state,@PathVariable("id")Integer id) {
		OrderItem item = new OrderItem();
		item.setItemId(id);
		item.setItemState(state);
		boolean b = orderItemSer.updateById(item);
		if(b) {
			return Msg.success().add("msg","修改成功！");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	
	/**
	 * 后台得到所有条目
	 * */
	@RequestMapping(value="/getItemsList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getItemsList(@RequestBody Map<Object,Object> kwMap) throws ParseException {
		int page = (int) kwMap.get("page");
		int limit = (int) kwMap.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) kwMap.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		EntityWrapper<OrderItem> wrapper = new EntityWrapper<>();
		String kwText = (String) afterMap.get("kwText");
		if(!kwText.equals("")) {
			wrapper.like("item_name",kwText).or().like("desc_one",kwText)
			.or().like("desc_two",kwText)
			.or().like("desc_three",kwText)
			.or().like("desc_four",kwText)
			.or().like("desc_five",kwText);
		}
		String itemState = (String) afterMap.get("itemState");
		if(!itemState.equals("0")) {
			wrapper.eq("item_state",itemState);
		}
		String min_integral = (String) afterMap.get("min_integral");
		String max_integral = (String) afterMap.get("max_integral");
		if(!min_integral.equals("")&&!max_integral.equals("")) {
			int min = Integer.parseInt(min_integral);
			int max = Integer.parseInt(max_integral);
			wrapper.between("item_price", min, max);
		}
		String start_date = (String) afterMap.get("start_date");
		String end_date = (String) afterMap.get("end_date");
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		if(!start_date.equals("") && !end_date.equals("")) {
			Date startDate = format1.parse(start_date);
			Date endDate = format1.parse(end_date);
			wrapper.between("create_time", startDate, endDate);
		}
		Page<Map<String, Object>> mapsPage = orderItemSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有订单条目");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	/**
	 * 添加条目
	 * */
	@RequestMapping(value="/addOrderItem",method=RequestMethod.POST)
	@ResponseBody
	public Msg addOrderItem(@RequestBody Map map) {
		String itemName = (String) map.get("itemName");
		String itemState = (String) map.get("itemState");
		String desc1 = (String) map.get("desc1");
		String desc2 = (String) map.get("desc2");
		String desc3 = (String) map.get("desc3");
		String desc4 = (String) map.get("desc4");
		String desc5 = (String) map.get("desc5");
		String price = (String) map.get("itemPrice");
		Integer itemPrice = Integer.parseInt(price);
		if(itemPrice<0) {
			return Msg.fail().add("msg","倒贴？兄弟你？不是吧？");
		}
		OrderItem item = new OrderItem();
		item.setItemName(itemName);
		item.setItemPrice(itemPrice);
		item.setItemState(itemState);
		item.setDescOne(desc1);
		item.setDescTwo(desc2);
		item.setDescThree(desc3);
		item.setDescFour(desc4);
		item.setDescFive(desc5);
		boolean b = orderItemSer.insert(item);
		if(b) {
			return Msg.success().add("msg","添加成功");
		}
		return Msg.fail().add("msg","添加失败！");
	}
	//============页面跳转====================
	//添加订单条目
	@RequestMapping(value="/toAddOrderItemPage",method=RequestMethod.GET)
	public String toAddOrderItemPage() {
		return "/orders/add-Item";
	}
	//所有订单条目
	@RequestMapping(value="/toOrderItemListPage",method=RequestMethod.GET)
	public String toOrderItemListPage() {
		return "/orders/list-items";
	}
	
}

