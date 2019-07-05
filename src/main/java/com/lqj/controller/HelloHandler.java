package com.lqj.controller;


import com.lqj.entity.Cart;
import com.lqj.entity.News;
import com.lqj.entity.ProductCategory;
import com.lqj.entity.User;
import com.lqj.repository.UsersRepository;
import com.lqj.service.AddressService;
import com.lqj.service.CartService;
import com.lqj.service.NewsService;
import com.lqj.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class HelloHandler {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private NewsService newsService;

    @Autowired
    private ProductService productService;

    @Autowired
    private CartService cartService;

    @Autowired
    private AddressService addressService;

    @PostMapping("/login")
    public String login(String loginName, @RequestParam("passWord") String password, Model model,HttpSession session){
        System.out.println("--->"+loginName+"--->"+password);
        User user = usersRepository.login(loginName, password);
        if(user == null){
            //重新登录
            return "redirect:/login.jsp";
        }else{
            //保存session
            List<Cart> carts = cartService.findByUserId(user.getId());
            user.setCarts(carts);
            session.setAttribute("user",user);
            //跳转到首页
            List<News> newsList = newsService.findAll();
            model.addAttribute("newsList",newsList);
            List<ProductCategory> categoryList = productService.findAll();
            model.addAttribute("categoryList",categoryList);
            return "redirect:/index";
        }
    }

    @GetMapping("/index")
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("main");
        modelAndView.addObject("newsList",newsService.findAll());
        modelAndView.addObject("categoryList",productService.findAll());
        return modelAndView;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        //重新登录
        return "redirect:/login.jsp";
    }

    @GetMapping("/findNewsByPage/{page}")
    public ModelAndView findNewsByPage(@PathVariable("page") Integer page){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("newsList");
        modelAndView.addObject("list",newsService.findByPage(page));
        modelAndView.addObject("pages",newsService.getPages());
        return modelAndView;
    }

    @GetMapping("/findAddressByUserId")
    public ModelAndView findAddressByUserId(HttpSession session){
        User user = (User) session.getAttribute("user");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userAddressList");
        modelAndView.addObject("list",addressService.findByUserId(user.getId()));
        return modelAndView;
    }

    @GetMapping("/deleteByAddressId/{id}")
    public String deleteByAddressId(@PathVariable("id") Integer id){
        System.out.println("--->deleteByAddressId");
        addressService.deleteByAddressId(id);
        return "redirect:/findAddressByUserId";
    }

    @PostMapping("/register")
    @ResponseBody
    public String register(User user){
        usersRepository.register(user);
        return "success";
    }

}
