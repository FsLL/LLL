package com.lqj.controller;

import com.lqj.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product")
public class ProductHandler {
    @Autowired
    private ProductService productService;

    @GetMapping("/findByLevelId/{type}/{id}")
    public ModelAndView findByLevelId(@PathVariable("type") Integer type, @PathVariable("id") Long id){
        System.out.println("进入controller");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("goodsList");
        modelAndView.addObject("products",productService.findByLevelId(type,id));
        modelAndView.addObject("categoryList",productService.findAll());
        return modelAndView;
    }

    @GetMapping("/findById/{id}")
    public ModelAndView findById(@PathVariable("id") Long id){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("productDetail");
        modelAndView.addObject("product",productService.findById(id));
        modelAndView.addObject("categoryList",productService.findAll());
        return modelAndView;
    }
}

