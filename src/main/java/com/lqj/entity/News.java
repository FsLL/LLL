package com.lqj.entity;

import lombok.Data;

@Data
public class News {
    private Long id;
    private String title;
    private String content;
    private Data createtime;
}
