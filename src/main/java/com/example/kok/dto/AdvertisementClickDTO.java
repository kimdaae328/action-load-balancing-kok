package com.example.kok.dto;

import com.example.kok.enumeration.RequestStatus;
import lombok.*;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Getter @Setter
@ToString
@NoArgsConstructor
public class AdvertisementClickDTO {
    private Long advertisementId;
}