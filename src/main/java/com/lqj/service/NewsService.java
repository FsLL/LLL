package com.lqj.service;

import com.lqj.entity.News;

import java.util.List;

public interface NewsService {

    public List<News> findAll();

    public List<News> findByPage(Integer page);
    public Integer getPages();
}
