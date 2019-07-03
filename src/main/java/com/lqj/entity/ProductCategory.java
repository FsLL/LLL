package com.lqj.entity;

import lombok.Data;

import java.util.List;

@Data
public class ProductCategory {
    private Long id;
    private String name;
    private Long parentId;
    private Integer type;
    //表示下级对象
    private List<ProductCategory> productCategories;
    //目录中的对象
    private List<Product> products;
}
