package com.lqj.repository;

import com.lqj.entity.News;

import java.util.List;

public interface NewsRepository {
    public List<News> findAll();
}
