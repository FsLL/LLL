package com.lqj.repository;

import com.lqj.entity.Product;
import com.lqj.entity.ProductVO;

import java.util.List;

public interface ProductRepository {
    public List<Product> findAllByLevelOneId(Long id);
    public List<Product> findByLevelId(ProductVO productVO);
    public Product findById(Long id);
}
