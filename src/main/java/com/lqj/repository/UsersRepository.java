package com.lqj.repository;

import com.lqj.entity.User;

public interface UsersRepository {

    public User login(String loginName,String passWord);
    public void register(User user);
}
