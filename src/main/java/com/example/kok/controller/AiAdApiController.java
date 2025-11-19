package com.example.kok.controller;

import com.example.kok.dto.AdvertisementClickDTO;
import com.example.kok.dto.AiAdvertisementDTO;
import com.example.kok.dto.ConsoleAdNoticeDTO;
import com.example.kok.service.ConsoleAdService;
import com.example.kok.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/ai/ad")
public class AiAdApiController {

    private final ConsoleAdService adService;
    private final MemberService memberService;

    @GetMapping("/list")
    public ResponseEntity<AiAdvertisementDTO> getAiAdvertisementList() {

        // 광고 한 달치 목록
        List<ConsoleAdNoticeDTO> adListOneMonth = adService.getAdvertisementsInOneMonth();

        // 광고 클릭 데이터
        List<AdvertisementClickDTO> adClickList = adService.getAdvertisementsCountOfClick();

        // 회원 한 달 로그인 수
        int loginCountInOneMonth = memberService.getLoginCountInOneMonth();

        AiAdvertisementDTO responseDTO = new AiAdvertisementDTO();
        responseDTO.setAdListOneMonth(adListOneMonth);
        responseDTO.setAdClickList(adClickList);
        responseDTO.setLoginCountInOneMonth(loginCountInOneMonth);

        return ResponseEntity.ok(responseDTO);
    }

}