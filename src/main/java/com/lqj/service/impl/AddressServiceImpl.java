package com.lqj.service.impl;

import com.lqj.entity.Address;
import com.lqj.entity.User;
import com.lqj.repository.AddressRepository;
import com.lqj.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressRepository addressRepository;

    @Override
    public List<Address> findByUserId(Long id) {
        return addressRepository.findByUserId(id);
    }

    @Override
    public void save(User user, String address, String remark) {
        Address addressObj = new Address();
        addressObj.setUser(user);
        addressObj.setAddress(address);
        addressObj.setRemark(remark);
        addressObj.setIsDefault(0);
        addressObj.setCreateTime(new Date());
        addressRepository.save(addressObj);
    }

    @Override
    public void deleteByAddressId(int id) {
        addressRepository.deleteByAddressId(id);
    }
}
