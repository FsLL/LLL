package com.lqj.service;

import com.lqj.entity.Address;
import com.lqj.entity.User;

import java.util.List;

public interface AddressService {
    public List<Address> findByUserId(Long id);
    public void save(User user, String address, String remark);
}
