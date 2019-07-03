package com.lqj.repository;

import com.lqj.entity.Address;

import java.util.List;

public interface AddressRepository {
    public List<Address> findByUserId(Long id);
}
