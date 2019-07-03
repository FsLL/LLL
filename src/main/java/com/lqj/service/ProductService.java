package com.lqj.service;

import com.lqj.entity.Product;
import com.lqj.entity.ProductCategory;

import java.util.List;

public interface ProductService {
    public List<ProductCategory> findAll();
    public List<Product> findByLevelId(Integer type, Long id);
    public Product findById(Long id);
}
