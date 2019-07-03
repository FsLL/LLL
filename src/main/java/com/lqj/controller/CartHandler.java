package com.lqj.controller;

import com.lqj.entity.Cart;
import com.lqj.entity.Product;
import com.lqj.entity.User;
import com.lqj.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartHandler {
    @Autowired
    private CartService cartService;

    @GetMapping("/add/{productId}/{quantity}/{cost}")
    public String add(@PathVariable("productId") Long productId, @PathVariable("quantity") Integer quantity, @PathVariable("cost") Integer cost, HttpSession session){
        User user = (User) session.getAttribute("user");
        Long userId = user.getId();
        Cart cart = new Cart(new Product(productId),quantity,cost,new User(userId));
        cartService.save(cart);
        return "redirect:/cart/findByUserId";
    }

    @GetMapping("/findByUserId")
    public ModelAndView findByUserId(HttpSession session){
        User user = (User) session.getAttribute("user");
        Long userId = user.getId();
        List<Cart> list = cartService.findByUserId(userId);
        //更新session
        user.setCarts(list);
        session.setAttribute("user",user);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("toSettlement");
        modelAndView.addObject("cartList",list);
        return modelAndView;
    }

    @GetMapping("/deleteById/{id}")
    public String deleteById(@PathVariable("id") Long id){
        System.out.println("进入controller---deleteById");
        cartService.deleteById(id);
         return  "redirect:/cart/findByUserId";
    }

    @PostMapping("/updateById/{id}/{quantity}/{price}")
    @ResponseBody
    public String updateById(@PathVariable("id") Long id,@PathVariable("quantity") Integer quantity,@PathVariable("price") Integer price){
        cartService.updateById(id, quantity, quantity*price);
        return "success";
    }
}

