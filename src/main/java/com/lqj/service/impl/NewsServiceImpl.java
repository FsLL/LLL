package com.lqj.service.impl;

import com.lqj.entity.News;
import com.lqj.repository.NewsRepository;
import com.lqj.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsRepository newsRepository;

    @Override
    public List<News> findAll() {
        return newsRepository.findAll();
    }
}
