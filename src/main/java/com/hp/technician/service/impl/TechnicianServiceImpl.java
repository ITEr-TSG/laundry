package com.hp.technician.service.impl;

import com.hp.technician.beans.Technician;
import com.hp.technician.mapper.TechnicianMapper;
import com.hp.technician.service.TechnicianService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-11-24
 */
@Service
public class TechnicianServiceImpl extends ServiceImpl<TechnicianMapper, Technician> implements TechnicianService {

}
