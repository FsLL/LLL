package com.lqj.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
public class User {
    private Long id;
    private String loginName;
    private String userName;
    private String password;
    private Integer sex;
    private String identityCode;
    private String email;
    private String mobile;
    private String fileName;
    private List<Cart> carts;

    public User(Long id) {
        this.id = id;
    }
}
