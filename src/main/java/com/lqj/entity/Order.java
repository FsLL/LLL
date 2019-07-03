package com.lqj.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Order {
    private Long id;
    private User user;
    private String useraddress;
    private Date createTime;
    private Integer cost;
    private String serialNumber;
}