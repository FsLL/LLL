package com.lqj.repository;

import com.lqj.entity.News;

import java.util.List;

public interface NewsRepository {
    public List<News> findAll();
    public List<News> findByPage(Integer index,Integer limit);
    public Integer count();
}
