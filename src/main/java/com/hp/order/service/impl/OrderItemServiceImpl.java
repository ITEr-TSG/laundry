package com.hp.order.service.impl;

import com.hp.order.beans.OrderItem;
import com.hp.order.mapper.OrderItemMapper;
import com.hp.order.service.OrderItemService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ITEr
 * @since 2019-11-29
 */
@Service
public class OrderItemServiceImpl extends ServiceImpl<OrderItemMapper, OrderItem> implements OrderItemService {

}
