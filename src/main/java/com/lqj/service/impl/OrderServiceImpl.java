package com.lqj.service.impl;

import com.lqj.entity.Cart;
import com.lqj.entity.Order;
import com.lqj.entity.OrderDetail;
import com.lqj.repository.OrderRepository;
import com.lqj.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Override
    public void save(Order order, List<Cart> carts) {
        //添加Order
        orderRepository.save(order);
        //添加OrderDetail
        for(Cart cart:carts){
            OrderDetail orderDetail = new OrderDetail();
            orderDetail.setProduct(cart.getProduct());
            orderDetail.setQuantity(cart.getQuantity());
            orderDetail.setCost(cart.getCost());
            orderDetail.setOrder(order);
            orderRepository.saveDetail(orderDetail);
        }
    }

    @Override
    public List<Order> findAllByUserId(Long id) {
        return orderRepository.findAllByUserId(id);
    }
}
