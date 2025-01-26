package com.tradex.basic.repository;

import com.tradex.basic.models.StockModel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface StockRepository extends JpaRepository<StockModel, Long> {

        List<StockModel> findByUserId(String userId);

    }

