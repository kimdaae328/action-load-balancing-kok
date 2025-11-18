package com.example.kok.service;

import com.example.kok.repository.AdvertisementClickDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AdvertisementClickServiceImpl implements AdvertisementClickService {
    private final AdvertisementClickDAO advertisementClickDAO;

    @Override
    public void saveAdvertisementClick(Long advertisementId, Long userId) {
        advertisementClickDAO.addAdvertisementClick(advertisementId, userId);
    }
}
