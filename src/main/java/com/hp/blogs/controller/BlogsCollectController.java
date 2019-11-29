package com.hp.blogs.controller;


import java.util.ArrayList;
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
import com.hp.blogs.beans.Blogs;
import com.hp.blogs.beans.BlogsCollect;
import com.hp.blogs.service.BlogsCollectService;
import com.hp.blogs.service.BlogsService;
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
@RequestMapping("/blogsCollect")
public class BlogsCollectController {
	
	@Autowired
	private BlogsCollectService blogsCollectSer;
	
	@Autowired
	private BlogsService blogSer;
	

	/**
	 * 后台查询所有点赞
	 * @return 
	 * */
	@RequestMapping(value="/getCollectList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getBlogsList(@RequestBody Map text){
		Integer page = (Integer) text.get("page");
		Integer limit = (Integer) text.get("limit");
		String kwText = (String) text.get("kwdata");
		EntityWrapper<BlogsCollect> wrapper = new EntityWrapper<>();
		if(!kwText.equals("")) {
			ArrayList<Integer> blogIds = new ArrayList<>();
			EntityWrapper<Blogs> blogsWra = new EntityWrapper<>();
			blogsWra.like("blog_text",kwText).or().like("blog_title",kwText);
			List<Blogs> list = blogSer.selectList(blogsWra);
			for (Blogs blogs : list) {
				blogIds.add(blogs.getBlogId());
			}
			wrapper.in("blog_id", blogIds);
		}
		
		Page<Map<String, Object>> mapsPage = blogsCollectSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有点赞");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
		
	}
	
	
	
	/**
	 * 收藏博客
	 * */
	@RequestMapping(value="/collectByCust",method=RequestMethod.POST)
	@ResponseBody
	public Msg collectByCust(@RequestBody Map map) {
		String custId = (String) map.get("startId");
		String custName = (String) map.get("startName");
		if(custId.equals("")||custName.equals("")) {
			return Msg.fail().add("msg","您还未登录！请你先登录客户再操作！");
		}
		Integer blogId = (Integer) map.get("blogId");
		int cuid = Integer.parseInt(custId);
		//判断是否已经点赞
		EntityWrapper<BlogsCollect> wrapper = new EntityWrapper<>();
		wrapper.eq("cust_id", cuid).eq("cust_name",custName).eq("blog_id",blogId);
		int count = blogsCollectSer.selectCount(wrapper);
		if(count!=0) {
			return Msg.fail().add("msg","您已经点赞了！");
		}
		
		//给原来的博客点赞+1
		Blogs blogs = blogSer.selectById(blogId);
		blogs.setPraiseInt(blogs.getPraiseInt()+1);
		blogSer.updateById(blogs);
		
		String technName = (String) map.get("technName");
		BlogsCollect entity = new BlogsCollect();
		entity.setBlogId(blogId);
		entity.setCollectState("点赞");
		entity.setCustName(custName);
		entity.setTechnName(technName);
		entity.setCustId(cuid);
		boolean b = blogsCollectSer.insert(entity);
		if(b) {
			return Msg.success().add("msg","点赞成功！");
		}else {
			return Msg.fail().add("msg","点赞失败！");
		}
	}
	//============页面跳转==============
	@RequestMapping(value="/toCollectPage",method=RequestMethod.GET)
	public String toCollectPage() {
		return "/blogs/list-collect";
	}
}

