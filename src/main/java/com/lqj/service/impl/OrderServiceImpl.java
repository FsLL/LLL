package com.lqj.service.impl;

import com.lqj.entity.Order;
import com.lqj.repository.OrderRepository;
import com.lqj.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Override
    public void save(Order order) {
        orderRepository.save(order);
    }
}
