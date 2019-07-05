package com.lqj.repository;

import com.lqj.entity.User;

import java.util.List;

public interface UsersRepository {

    public User login(String loginName,String passWord);
    public void register(User user);
    public List<User> findAllUser(Integer index,Integer limit);
    public Integer count();
}
