package com.lqj.repository;

import com.lqj.entity.Cart;

import java.util.List;

public interface CartRepository {
    public void save(Cart cart);
    public List<Cart> findByUserId(Long id);
    public void deleteById(Long id);
    public void updateById(Long id,Integer quantity,Integer cost);
    public void deleteByUserId(Long id);
}
