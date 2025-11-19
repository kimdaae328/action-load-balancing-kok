package com.example.kok.dto;

import lombok.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Getter @Setter
@ToString
@NoArgsConstructor
public class AiAdvertisementDTO {
    private List<AdvertisementClickDTO> adClickList; // 한 달치 광고 클릭수
    private int loginCountInOneMonth; // 한 달치 로그인한 수
}
