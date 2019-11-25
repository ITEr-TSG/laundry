package com.hp.technician.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
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
@RequestMapping("/technMidSort")
public class TechnMidSortController {

	@Autowired
	private TechnMidSortService midSer;		//中间表
	
	@Autowired
	private TechnSortService technSortSer;
	
	/**
	 * 根据technId查询到对应所属的分类
	 * */
	@RequestMapping(value="/getSortNameByTechnId/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getSortNameByTechnId(@PathVariable("id")Integer technId) {
		EntityWrapper<TechnMidSort> wrapper = new	EntityWrapper<>();
		wrapper.eq("techn_id",technId);
		List<TechnMidSort> midList = midSer.selectList(wrapper);
		if(midList.isEmpty()) {
			return Msg.success().add("sort","该技师暂未分类。");
		}
		ArrayList<Integer> idList = new ArrayList<>();
		for (TechnMidSort technMidSort : midList) {
			idList.add(technMidSort.getSortId());
		}
		List<TechnSort> list = technSortSer.selectBatchIds(idList);
		String sort = "";
		for (TechnSort technSort : list) {
			sort += technSort.getSortName()+"、";
		}
		return Msg.success().add("sort", sort);
	}
	
	/**
	 * 修改分类，格式化修改
	 * */
	@RequestMapping(value="/updateMid",method=RequestMethod.POST)
	@ResponseBody
	public Msg updateMid(TechnMidSort up) {
		System.out.println(up);
		List<Integer> ids = up.getSortIds();
		if(ids == null) {
			return Msg.fail().add("msg","请选择分类！");
		}
		EntityWrapper<TechnMidSort> wrapper = new EntityWrapper<>();
		wrapper.eq("techn_id", up.getTechnId());
		int count = midSer.selectCount(wrapper);
		if(count != 0) {
			//把之前的映射关系删除
			midSer.delete(wrapper);
		}
		
		ArrayList<TechnMidSort> entityList = new ArrayList<>();
		for (Integer id : ids) {
			TechnMidSort midSort = new TechnMidSort();
			midSort.setSortId(id);
			midSort.setTechnId(up.getTechnId());
			entityList.add(midSort);
		}
		boolean b = midSer.insertBatch(entityList);
		if(!b) {
			return Msg.fail().add("msg","失败！");
		}
		return Msg.success().add("msg", "成功");
	}
	
	
}

