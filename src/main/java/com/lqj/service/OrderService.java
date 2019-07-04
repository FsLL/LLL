package com.lqj.service;

import com.lqj.entity.Cart;
import com.lqj.entity.Order;

import java.util.List;

public interface OrderService {
    public void save(Order order, List<Cart> carts);
    public List<Order> findAllByUserId(Long id);
}
