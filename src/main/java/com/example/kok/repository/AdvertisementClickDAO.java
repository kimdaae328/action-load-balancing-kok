package com.example.kok.repository;

import com.example.kok.mapper.AdvertisementClickMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class AdvertisementClickDAO {
    private final AdvertisementClickMapper advertisementClickMapper;

    public void addAdvertisementClick(Long advertisementId, Long userId) {
        advertisementClickMapper.insertAdvertisementClick(advertisementId, userId);
    }
}
