package com.smartdine.service;

import com.smartdine.dto.AnalyticsDTO;
import com.smartdine.dto.TopItemDTO;
import com.smartdine.model.Order;
import com.smartdine.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class AnalyticsService {
    
    private final OrderRepository orderRepository;
    
    public AnalyticsDTO getAnalytics(String branchId, String period) {
        List<Order> orders = orderRepository.findByBranchId(branchId);
        
        // Filter orders by period
        LocalDateTime startDate = getStartDateForPeriod(period);
        List<Order> filteredOrders = orders.stream()
                .filter(o -> o.getCreatedAt().isAfter(startDate))
                .collect(Collectors.toList());
        
        AnalyticsDTO analytics = new AnalyticsDTO();
        analytics.setBranchId(branchId);
        analytics.setPeriod(period);
        
        // Calculate metrics
        double totalRevenue = filteredOrders.stream()
                .mapToDouble(Order::getTotalAmount)
                .sum();
        analytics.setTotalRevenue(totalRevenue);
        analytics.setTotalOrders(filteredOrders.size());
        analytics.setAverageOrderValue(
            filteredOrders.isEmpty() ? 0 : totalRevenue / filteredOrders.size()
        );
        
        // Orders by status
        Map<String, Long> ordersByStatus = filteredOrders.stream()
                .collect(Collectors.groupingBy(
                    o -> o.getStatus().toString(),
                    Collectors.counting()
                ));
        analytics.setOrdersByStatus(ordersByStatus);
        
        // Revenue by day
        Map<String, Double> revenueByDay = filteredOrders.stream()
                .collect(Collectors.groupingBy(
                    o -> o.getCreatedAt().toLocalDate().toString(),
                    Collectors.summingDouble(Order::getTotalAmount)
                ));
        analytics.setRevenueByDay(revenueByDay);
        
        // Top selling items
        List<TopItemDTO> topItems = getTopSellingItems(filteredOrders, 10);
        analytics.setTopSellingItems(topItems);
        
        // Customer satisfaction (mock value for now)
        analytics.setCustomerSatisfaction(0.85);
        analytics.setGeneratedAt(LocalDateTime.now());
        
        return analytics;
    }
    
    public Map<String, Object> getDashboardStats(String branchId) {
        List<Order> orders = orderRepository.findByBranchId(branchId);
        
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalOrders", orders.size());
        stats.put("pendingOrders", orders.stream()
                .filter(o -> o.getStatus() == Order.OrderStatus.PENDING)
                .count());
        stats.put("completedOrders", orders.stream()
                .filter(o -> o.getStatus() == Order.OrderStatus.DELIVERED)
                .count());
        stats.put("totalRevenue", orders.stream()
                .mapToDouble(Order::getTotalAmount)
                .sum());
        
        return stats;
    }
    
    public List<TopItemDTO> getTopSellingItems(String branchId, int limit) {
        List<Order> orders = orderRepository.findByBranchId(branchId);
        return getTopSellingItems(orders, limit);
    }
    
    private List<TopItemDTO> getTopSellingItems(List<Order> orders, int limit) {
        Map<String, TopItemDTO> itemsMap = new HashMap<>();
        
        orders.forEach(order -> {
            order.getItems().forEach(item -> {
                String itemId = item.getId();
                TopItemDTO topItem = itemsMap.getOrDefault(itemId, 
                    new TopItemDTO(itemId, item.getName(), 0, 0.0));
                topItem.setQuantitySold(topItem.getQuantitySold() + item.getQuantity());
                topItem.setRevenue(topItem.getRevenue() + (item.getPrice() * item.getQuantity()));
                itemsMap.put(itemId, topItem);
            });
        });
        
        return itemsMap.values().stream()
                .sorted(Comparator.comparing(TopItemDTO::getQuantitySold).reversed())
                .limit(limit)
                .collect(Collectors.toList());
    }
    
    private LocalDateTime getStartDateForPeriod(String period) {
        LocalDateTime now = LocalDateTime.now();
        return switch (period.toUpperCase()) {
            case "DAILY" -> now.minusDays(1);
            case "WEEKLY" -> now.minusWeeks(1);
            case "MONTHLY" -> now.minusMonths(1);
            case "YEARLY" -> now.minusYears(1);
            default -> now.minusDays(1);
        };
    }
}
