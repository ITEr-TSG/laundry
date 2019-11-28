package com.hp.blogs.service.impl;

import com.hp.blogs.beans.Blogs;
import com.hp.blogs.mapper.BlogsMapper;
import com.hp.blogs.service.BlogsService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-11-28
 */
@Service
public class BlogsServiceImpl extends ServiceImpl<BlogsMapper, Blogs> implements BlogsService {

}
