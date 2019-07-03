package com.lqj.repository;

import com.lqj.entity.ProductCategory;

import java.util.List;

public interface ProductCategoryRepository {
    //查询一级分类
//    public List<ProductCategory> findAllLevelOne();
//    //查询二级分类
//    public List<ProductCategory> findAllLevelTwoByParentId(Long id);
//    //查询三级分类
//    public List<ProductCategory> findAllLevelThreeByParentId(Long id);


    public List<ProductCategory> findAllByTypeAndParentId(Integer type,Long id);

}
