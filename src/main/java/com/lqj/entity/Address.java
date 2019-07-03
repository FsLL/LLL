package com.lqj.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Address {
    private Long id;
    private User user;
    private String address;
    private Date createTime;
    private Integer isDefault;
    private String remark;
}