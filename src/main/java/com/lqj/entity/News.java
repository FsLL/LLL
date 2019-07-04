package com.lqj.entity;

import lombok.Data;

import java.util.Date;

@Data
public class News {
    private Long id;
    private String title;
    private String content;
    private Date createtime;
}
