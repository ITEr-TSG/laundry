package com.hp.technician.controller;


import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
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
import com.hp.technician.beans.TechnMidSort;
import com.hp.technician.beans.TechnSort;
import com.hp.technician.service.TechnMidSortService;
import com.hp.technician.service.TechnSortService;
import com.hp.utils.Msg;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ITEr
 * @since 2019-11-24
 */
@Controller
@RequestMapping("/technSort")
public class TechnSortController {

	@Autowired
	private TechnSortService technSortSer;	//分类表
	
	@Autowired
	private TechnMidSortService midSer;		//中间表
	
	
	/**
	 * 得到所有的分类，用于筛选的
	 * @return 
	 * */
	@RequestMapping(value="/getSorts",method=RequestMethod.GET)
	@ResponseBody
	public List<TechnSort> getSorts() {
		List<TechnSort> list = technSortSer.selectList(null);
		return list;
	}
	/**
	 * 修改分类
	 * */
	@RequestMapping(value="/editSort",method=RequestMethod.POST)
	@ResponseBody
	public Msg editSort(TechnSort techn) {
		boolean b = technSortSer.updateById(techn);
		if(b) {
			return Msg.success().add("msg","成功！");
		}
		return Msg.fail().add("msg","失败！");
	}
	
	/**
	 * 删除分类
	 * */
	@RequestMapping(value="/delById/{sortId}",method=RequestMethod.GET)
	@ResponseBody
	public Msg delById(@PathVariable("sortId")Integer id) {
		//先查询中间表有没有技师属于该分类
		EntityWrapper<TechnMidSort> midWrapper = new EntityWrapper<>();
		midWrapper.eq("sort_id",id);
		int count = midSer.selectCount(midWrapper);
		if(count!=0) {
			return Msg.fail().add("msg","删除失败！该分类下有技师！");
		}
		boolean b = technSortSer.deleteById(id);
		if(b) {
			return Msg.success().add("msg","成功！");
		}
		return Msg.fail().add("msg","失败！");
	}
	
	/**
	 * 添加分类
	 * */
	@RequestMapping(value="/addSort/{name}",method=RequestMethod.GET)
	@ResponseBody
	public Msg addSort(@PathVariable("name") String name) {
		EntityWrapper<TechnSort> wrapper = new EntityWrapper<>();
		wrapper.eq("sort_name", name);
		int count = technSortSer.selectCount(wrapper);
		if(count!=0) {
			return Msg.fail().add("msg","该分类已经存在");
		}
		TechnSort entity = new TechnSort();
		entity.setSortName(name);
		entity.setSortWeight(0);
		boolean b = technSortSer.insert(entity);
		if(b) {
			return Msg.success().add("msg","添加成功！");
		}
		return Msg.fail().add("msg","添加失败！");
	}
	
	/**
	 * 得到所有分类
	 * @return 
	 * */
	@RequestMapping(value="/getTechnSortList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getTechnSortList(@RequestBody Map map) {
		String name = (String) map.get("kwdata");
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		EntityWrapper<TechnSort> wrapper = new EntityWrapper<>();
		if(!name.equals("")) {
			wrapper.like("sort_name", name);
		}
		wrapper.orderDesc(Arrays.asList("sort_weight"));
		Page<Map<String, Object>> mapsPage = technSortSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有分类");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
	}
	
	//=======页面跳转============
	@RequestMapping(value="/toMenageSortPage",method=RequestMethod.GET)
	public String toMenageSortPage() {
		return "/technician/manage-sort";
	}
}

