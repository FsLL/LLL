package com.lqj.service.impl;

import com.lqj.entity.Product;
import com.lqj.entity.ProductCategory;
import com.lqj.entity.ProductVO;
import com.lqj.repository.ProductCategoryRepository;
import com.lqj.repository.ProductRepository;
import com.lqj.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductCategoryRepository productCategoryRepository;
    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<ProductCategory> findAll() {
        List<ProductCategory> list1 = productCategoryRepository.findAllByTypeAndParentId(1,0L);
        for (ProductCategory productCategory:list1){
            productCategory.setProducts(productRepository.findAllByLevelOneId(productCategory.getId()));
            List<ProductCategory> list2 = productCategoryRepository.findAllByTypeAndParentId(2,productCategory.getId());
            productCategory.setProductCategories(list2);
            for (ProductCategory productCategory2 : list2){
                List<ProductCategory> list3 = productCategoryRepository.findAllByTypeAndParentId(3,productCategory2.getId());
                productCategory2.setProductCategories(list3);
            }
        }
            return list1;
        }

    @Override
    public List<Product> findByLevelId(Integer type, Long id) {
        return productRepository.findByLevelId(new ProductVO(type,id));
    }

    @Override
    public Product findById(Long id) {
        return productRepository.findById(id);
    }


}
