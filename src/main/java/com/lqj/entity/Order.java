package com.lqj.entity;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class Order {
    private Long id;
    private User user;
    private String useraddress;
    private Date createTime;
    private Integer cost;
    private String serialNumber;
    private List<OrderDetail> orderDetails;
}