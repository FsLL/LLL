package com.lqj.repository;

import com.lqj.entity.Order;
import com.lqj.entity.OrderDetail;

import java.util.List;

public interface OrderRepository {
    public void save(Order order);
    public void saveDetail(OrderDetail orderDetail);
    public List<Order> findAllByUserId(Long id);
}

