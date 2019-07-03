package com.lqj.service.impl;

import com.lqj.entity.Address;
import com.lqj.repository.AddressRepository;
import com.lqj.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressRepository addressRepository;

    @Override
    public List<Address> findByUserId(Long id) {
        return addressRepository.findByUserId(id);
    }
}
