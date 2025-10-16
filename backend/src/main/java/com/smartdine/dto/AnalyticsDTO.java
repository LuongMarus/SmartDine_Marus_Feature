package com.smartdine.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AnalyticsDTO {
    private String branchId;
    private String period;
    private Double totalRevenue;
    private Integer totalOrders;
    private Double averageOrderValue;
    private Map<String, Long> ordersByStatus;
    private Map<String, Double> revenueByDay;
    private List<TopItemDTO> topSellingItems;
    private Double customerSatisfaction;
    private LocalDateTime generatedAt;
}
