package com.lqj.controller;

import com.lqj.entity.Cart;
import com.lqj.entity.Order;
import com.lqj.entity.User;
import com.lqj.service.AddressService;
import com.lqj.service.CartService;
import com.lqj.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/order")
public class OrderHandler {
    @Autowired
    private CartService cartService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private OrderService orderService;

    @GetMapping("/createOrder")
    public ModelAndView createOrder(HttpSession session){
        User user = (User) session.getAttribute("user");
        Long userId = user.getId();
        List<Cart> list = cartService.findByUserId(userId);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("settlement2");
        modelAndView.addObject("cartList",list);
        modelAndView.addObject("addressList",addressService.findByUserId(userId));
        return modelAndView;
    }

    @PostMapping("/settlement")
    public ModelAndView settlement(String selectAddress,Integer cost,HttpSession session,String address,String remark){
        Order order = new Order();
        User user = (User) session.getAttribute("user");
        //判断是否为新地址
        if(selectAddress.equals("newAddress")){
            //1、将新地址保存到数据库中
            addressService.save(user,address,remark);
            //2、注入到 Order
            selectAddress = address;
        }
        order.setUseraddress(selectAddress);
        order.setCost(cost);
        order.setCreateTime(new Date());
        String seriaNumber = null;
        try {
            StringBuffer result = new StringBuffer();
            for(int i=0;i<32;i++) {
                result.append(Integer.toHexString(new Random().nextInt(16)));
            }
            seriaNumber =  result.toString().toUpperCase();
        } catch (Exception e) {
            e.printStackTrace();
        }
        order.setSerialNumber(seriaNumber);
        order.setUser(user);
        List<Cart> list = cartService.findByUserId(user.getId());
        orderService.save(order,list);
        cartService.deleteByUserId(user.getId());
        user.setCarts(cartService.findByUserId(user.getId()));
        session.setAttribute("user",user);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("order",order);
        modelAndView.setViewName("settlement3");
        return modelAndView;
    }

    @GetMapping("/findAllByUserId")
    public ModelAndView findAllByUserId(HttpSession session){
        User user = (User) session.getAttribute("user");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("orderList");
        modelAndView.addObject("list",orderService.findAllByUserId(user.getId()));
        return modelAndView;
    }
}
