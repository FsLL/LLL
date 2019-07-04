package com.lqj.entity;

import lombok.Data;

@Data
public class OrderDetail {
    public Order order;
    public Product product;
    public Integer quantity;
    public Integer cost;
}
