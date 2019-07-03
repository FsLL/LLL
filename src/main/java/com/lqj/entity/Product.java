package com.lqj.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Product {
    private Long id;
    private String name;
    private String description;
    private Integer price;
    private Integer stock;
    private String fileName;

    public Product(Long id) {
        this.id = id;
    }
}
