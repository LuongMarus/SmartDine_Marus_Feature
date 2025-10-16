package com.smartdine.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TopItemDTO {
    private String itemId;
    private String name;
    private Integer quantitySold;
    private Double revenue;
}
