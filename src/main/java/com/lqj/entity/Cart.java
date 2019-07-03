package com.lqj.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Cart {
    private Long id;
    private Product product;
    private Integer quantity;
    private Integer cost;
    private User user;

    public Cart(Product product, Integer quantity, Integer cost, User user) {
        this.product = product;
        this.quantity = quantity;
        this.cost = cost;
        this.user = user;
    }
}