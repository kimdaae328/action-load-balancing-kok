package com.example.kok.controller;

import com.example.kok.auth.CustomUserDetails;
import com.example.kok.dto.AdvertisementClickDTO;
import com.example.kok.service.AdvertisementClickService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/advertisement/**")
public class AdvertisementClickController {
    private final AdvertisementClickService advertisementClickService;

    @PostMapping("click")
    public void click(@RequestBody AdvertisementClickDTO dto,
                      @AuthenticationPrincipal CustomUserDetails customUserDetails) {

        Long userId = customUserDetails.getId();

        advertisementClickService.saveAdvertisementClick(dto.getId(), userId);
    }
}
