package com.lqj.service.impl;

import com.lqj.entity.Cart;
import com.lqj.repository.CartRepository;
import com.lqj.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    private CartRepository cartRepository;

    @Override
    public void save(Cart cart) {
        cartRepository.save(cart);
    }

    @Override
    public List<Cart> findByUserId(Long id) {
        return cartRepository.findByUserId(id);
    }

    @Override
    public void deleteById(Long id) {
        cartRepository.deleteById(id);
    }

    @Override
    public void updateById(Long id, Integer quantity, Integer cost) {
        cartRepository.updateById(id, quantity, cost);
    }

    @Override
    public void deleteByUserId(Long id) {
        cartRepository.deleteByUserId(id);
    }
}

