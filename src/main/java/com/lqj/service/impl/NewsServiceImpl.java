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
    private Integer limit = 10;

    @Override
    public List<News> findAll() {
        return newsRepository.findAll();
    }

    @Override
    public List<News> findByPage(Integer page) {
        return newsRepository.findByPage((page-1)*limit,limit);
    }

    @Override
    public Integer getPages() {
        Integer count = newsRepository.count();
        Integer pages = 0;
        if(count%limit == 0){
            pages = count/limit;
        }else{
            pages = count/limit+1;
        }
        return pages;
    }
}
