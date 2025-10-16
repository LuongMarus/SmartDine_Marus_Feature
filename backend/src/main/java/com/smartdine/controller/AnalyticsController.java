package com.smartdine.controller;

import com.smartdine.dto.AnalyticsDTO;
import com.smartdine.dto.TopItemDTO;
import com.smartdine.service.AnalyticsService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/analytics")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class AnalyticsController {
    
    private final AnalyticsService analyticsService;
    
    @GetMapping("/{branchId}")
    public ResponseEntity<AnalyticsDTO> getAnalytics(
            @PathVariable String branchId,
            @RequestParam(defaultValue = "daily") String period) {
        AnalyticsDTO analytics = analyticsService.getAnalytics(branchId, period);
        return ResponseEntity.ok(analytics);
    }
    
    @GetMapping("/{branchId}/dashboard")
    public ResponseEntity<Map<String, Object>> getDashboardStats(@PathVariable String branchId) {
        Map<String, Object> stats = analyticsService.getDashboardStats(branchId);
        return ResponseEntity.ok(stats);
    }
    
    @GetMapping("/{branchId}/top-items")
    public ResponseEntity<List<TopItemDTO>> getTopSellingItems(
            @PathVariable String branchId,
            @RequestParam(defaultValue = "10") int limit) {
        List<TopItemDTO> topItems = analyticsService.getTopSellingItems(branchId, limit);
        return ResponseEntity.ok(topItems);
    }
}
