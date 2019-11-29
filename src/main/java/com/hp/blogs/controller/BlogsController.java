package com.hp.blogs.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.hp.blogs.beans.Blogs;
import com.hp.blogs.service.BlogsService;
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
 * @since 2019-11-28
 */
@Controller
@RequestMapping("/blogs")
public class BlogsController {

	/**
	 * 文件保存的路径
	 */
	public static final String SAVE_PATH = "D:\\laundry\\blog_imgs";
	
	@Autowired
	private BlogsService blogSer;
	
	@Autowired
	private TechnicianService technSer;	//技师
	
	/**
	 * 后台根据id查询博客
	 * */
	@RequestMapping(value="/getById/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getById(@PathVariable("id")Integer id) {
		Blogs blog = blogSer.selectById(id);
		return Msg.success().add("blog",blog);
	}
	
	/**
	 * 后台查询所有博客
	 * @return 
	 * */
	@RequestMapping(value="/getBlogsList",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getBlogsList(@RequestBody Map text){
		Integer page = (Integer) text.get("page");
		Integer limit = (Integer) text.get("limit");
		String kwText = (String) text.get("kwdata");
		EntityWrapper<Blogs> wrapper = new EntityWrapper<>();
		if(!kwText.equals("")) {
			wrapper.like("blog_text",kwText).or().like("blog_title",kwText);
		}
		Page<Map<String, Object>> mapsPage = blogSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有博客");
		resultMap.put("total",mapsPage.getTotal());
		resultMap.put("data",mapsPage.getRecords());
		return resultMap;
		
	}
	
	
	/**
	 * 前台的博客中心
	 * @return 
	 * */
	@RequestMapping(value="/getBlogByCust",method=RequestMethod.POST)
	@ResponseBody
	public List<Blogs> getBlogByCust(@RequestBody Map map) {
		String kw = (String) map.get("data");
		EntityWrapper<Blogs> wrapper = new EntityWrapper<>();
		if(!kw.equals("")) {
			wrapper.like("blog_text",kw);
		}
		wrapper.eq("is_show","展示");
		wrapper.orderBy("praise_int", false);
		List<Blogs> list = blogSer.selectList(wrapper);
		for (Blogs blogs : list) {
			Technician techn = technSer.selectById(blogs.getTechnId());
			blogs.setTechnName(techn.getTechnRealName());
		}
		return list;
	}
	
	
	/**
	 * 前台删除
	 * */
	@RequestMapping(value="/delByTechn/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg delByTechn(@PathVariable("id")Integer id) {
		Blogs blogs = new Blogs();
		blogs.setBlogId(id);
		blogs.setIsShow("删除");
		boolean b = blogSer.updateById(blogs);
		if(b) {
			return Msg.success().add("msg","删除成功！");
		}
		return Msg.fail().add("msg","删除失败！");
	}
	/**
	 * 管理员删除
	 * */
	@RequestMapping(value="/delByAdmin/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg delByAdmin(@PathVariable("id")Integer id) {
		boolean b = blogSer.deleteById(id);
		if(b) {
			return Msg.success().add("msg","删除成功！");
		}
		return Msg.fail().add("msg","删除失败！");
	}
	
	
	/**
	 * 修改博客
	 * */
	@RequestMapping(value="/editBlog",method=RequestMethod.POST)
	@ResponseBody
	public Msg editBlog(@RequestBody Map map) {
		String blogText = (String) map.get("text");
		String blogId = (String) map.get("id");
		String title = (String) map.get("title");
		int id = Integer.parseInt(blogId);
		String state = (String) map.get("state");
		Blogs blogs = new Blogs();
		blogs.setBlogId(id);
		blogs.setBlogText(blogText);
		blogs.setIsShow(state);
		blogs.setBlogTitle(title);
		boolean b = blogSer.updateById(blogs);
		if(b) {
			return Msg.success().add("msg","修改成功！");
		}
		return Msg.fail().add("msg","修改失败！");
	}
	
	/**
	 * 前端技师查询所有博客
	 * @return 
	 * */
	@RequestMapping(value="/getBlogsListByTechn",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getBlogsListByTechn(@RequestBody Map map) {
		int page = (int) map.get("page");
		int limit = (int) map.get("limit");
		ArrayList<Map> arrayList = new ArrayList<>();
		arrayList = (ArrayList<Map>) map.get("kwdata");
		AnalysisKeyWordsListUtils utils = new AnalysisKeyWordsListUtils();
		HashMap<String, Object> afterMap = utils.analysisKeyWordsList(arrayList);
		String technId = (String) afterMap.get("technId");
		int id = Integer.parseInt(technId);
		EntityWrapper<Blogs> wrapper = new EntityWrapper<>();
		wrapper.eq("techn_id", id);
		String isShow = (String) afterMap.get("isShow");
		if(!isShow.equals("0")) {
			wrapper.eq("is_show", isShow);
		}
		String blogText = (String) afterMap.get("blogText");
		if(!blogText.equals("")) {
			wrapper.like("blog_text", blogText).or().like("blog_title",blogText);
		}
		wrapper.ne("is_show", "删除");
		Page<Map<String, Object>> selectMapsPage = blogSer.selectMapsPage(new Page<>(page, limit), wrapper);
		Map<String,Object> resultMap = new HashMap<String, Object>();
		resultMap.put("status",0);
		resultMap.put("message","所有博客");
		resultMap.put("total",selectMapsPage.getTotal());
		resultMap.put("data",selectMapsPage.getRecords());
		return resultMap;
	}
	
	
	/**
	 * 写博客
	 * */
	@RequestMapping(value="/writeBlog",method=RequestMethod.POST)
	@ResponseBody
	public Msg writeBlog(@RequestBody Map map) {
		String blogText = (String) map.get("text");
		String technId = (String) map.get("id");
		String title = (String) map.get("title");
		int id = Integer.parseInt(technId);
		String state = (String) map.get("state");
		Blogs blogs = new Blogs();
		blogs.setTechnId(id);
		blogs.setBlogTitle(title);
		blogs.setBlogText(blogText);
		blogs.setIsShow(state);
		blogs.setPraiseInt(0);
		boolean b = blogSer.insert(blogs);
		if(b) {
			return Msg.success().add("msg","编写成功！");
		}
		return Msg.fail().add("msg","编写失败！");
	}
	
	/**
	 * 上传图片
	 * @return 
	 * */
	@RequestMapping(value="/uploadBlogImg",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> uploadNewFoodImg(@RequestParam("file") CommonsMultipartFile file) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = UploadFileUtil.uploadFile(file, SAVE_PATH);
		if(result.equals("error")) {
			resultMap.put("code", 1);
			resultMap.put("msg", "图片上传失败");
			return resultMap;	
		}
		String technician = "/file/blog_imgs/"+result;
		resultMap.put("errno", 0);
		resultMap.put("msg", "图片上传成功");
		resultMap.put("data", technician);
		return resultMap;
	}
	
	//==============页面跳转===============
	//到写博客界面
	@RequestMapping(value="/writeBlog/{id}/{phone}",method=RequestMethod.GET)
	public String writeBlog(@PathVariable("id")Integer technId,@PathVariable("phone")String phone
			,Model model) {
		EntityWrapper<Technician> wrapper = new EntityWrapper<>();
		wrapper.eq("technician_id", technId).eq("techn_phone",phone);
		Technician selectOne = technSer.selectOne(wrapper);
		if(selectOne==null) {
			model.addAttribute("technError", "未查询到该技师");
			return "forward:/pages/blogs/write-blog.jsp";
		}
		model.addAttribute("techn", selectOne);
		return "forward:/pages/blogs/write-blog.jsp";
	}
	//到查询所有的博客界面
	@RequestMapping(value="/getBlogsByTechn/{id}/{phone}",method=RequestMethod.GET)
	public String getBlogsByTechn(@PathVariable("id")Integer technId,@PathVariable("phone")String phone
			,Model model) {
		EntityWrapper<Technician> wrapper = new EntityWrapper<>();
		wrapper.eq("technician_id", technId).eq("techn_phone",phone);
		Technician selectOne = technSer.selectOne(wrapper);
		if(selectOne==null) {
			model.addAttribute("technError", "未查询到该技师");
			return "forward:/pages/blogs/list-blog.jsp";
		}
		model.addAttribute("techn", selectOne);
		return "forward:/pages/blogs/list-blog.jsp";
	}
	//后台管理所有博客页面
	@RequestMapping(value="/toTechnBlogsListPage",method=RequestMethod.GET)
	public String toTechnBlogsListPage() {
		return "/blogs/list-blogs";
		
	}
}

