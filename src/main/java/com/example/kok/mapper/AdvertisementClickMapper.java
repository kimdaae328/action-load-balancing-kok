package com.example.kok.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdvertisementClickMapper {
    public void insertAdvertisementClick(Long advertisementId, Long userId);
}
