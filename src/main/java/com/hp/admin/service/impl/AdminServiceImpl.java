package com.hp.admin.service.impl;

import com.hp.admin.beans.Admin;
import com.hp.admin.mapper.AdminMapper;
import com.hp.admin.service.AdminService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-11-22
 */
@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {

}
