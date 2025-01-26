package com.tradex.basic.controller;

import com.tradex.basic.models.StockModel;
import com.tradex.basic.repository.StockRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class controller {

    @Autowired
    private StockRepository stockRepository;

    @GetMapping("/")
    public String start() {
        return "Welcome to Traders Hub!";
    }

    @GetMapping("get")
    public List<StockModel> getAllStocks() {
        return stockRepository.findAll();
    }

    @GetMapping("/user/{userId}")
    public List<StockModel> getIndividualUsersStock(@PathVariable String userId) {
        return stockRepository.findByUserId(userId);
    }

    @PostMapping("/add")
    public StockModel addStock(@RequestBody StockModel stock) {
        return stockRepository.save(stock);
    }
}
