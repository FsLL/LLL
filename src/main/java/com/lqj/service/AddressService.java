package com.lqj.service;

import com.lqj.entity.Address;

import java.util.List;

public interface AddressService {
    public List<Address> findByUserId(Long id);
}
