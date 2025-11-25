package com.smartdine.services;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smartdine.models.Item;
import com.smartdine.models.Menu;
import com.smartdine.models.Order;
import com.smartdine.models.OrderItem;
import com.smartdine.repository.MenuRepository;
import com.smartdine.repository.OrderRepository;

@Service
public class MenuServices {

    @Autowired
    private MenuRepository menuRepository;
    
    @Autowired
    private OrderItemService orderItemService;
    
    @Autowired
    private ItemServices itemServices;
    
    @Autowired
    private OrderRepository orderRepository;

    public List<Menu> getAll() {
        return menuRepository.findAll();
    }
    
    //Lay menu theo company id
    public List<Menu> getByCompanyId(Integer companyId) {
        return menuRepository.findByCompanyId(companyId);
    }
    public Menu getById(Integer id) {
        return menuRepository.findById(id).orElse(null);
    }

    public Menu create(Menu menu) {
        return menuRepository.save(menu);
    }

    public Menu update(Integer id, Menu updatedMenu) {
        Optional<Menu> existingOptional = menuRepository.findById(id);
        if (existingOptional.isEmpty()) {
            return null;
        }

        Menu existingMenu = existingOptional.get();
        existingMenu.setCompanyId(updatedMenu.getCompanyId());
        existingMenu.setName(updatedMenu.getName());
        existingMenu.setDescription(updatedMenu.getDescription());
        existingMenu.setStatusId(updatedMenu.getStatusId());
        existingMenu.setDeletedAt(updatedMenu.getDeletedAt());
        existingMenu.setUpdatedAt(LocalDateTime.now());

        return menuRepository.save(existingMenu);
    }

    // Lấy top dishes theo branch (dựa trên số lượng bán được)
    public List<Map<String, Object>> getTopDishesByBranch(Integer branchId, int limit) {
        try {
            // Lấy tất cả orders của branch này
            List<Order> orders = orderRepository.findByBranchId(branchId);
            
            // Lấy orderIds
            List<Integer> orderIds = orders.stream()
                .map(Order::getId)
                .collect(Collectors.toList());
            
            // Lấy tất cả order items của các orders này
            List<OrderItem> orderItems = orderItemService.getOrderItemsByOrderIds(orderIds);
            
            // Group by itemId và tính tổng quantity
            Map<Integer, Integer> itemQuantityMap = new HashMap<>();
            Map<Integer, Integer> itemRevenueMap = new HashMap<>();
            
            for (OrderItem orderItem : orderItems) {
                Integer itemId = orderItem.getItemId();
                Integer quantity = orderItem.getQuantity();
                
                // Tính tổng quantity
                itemQuantityMap.put(itemId, itemQuantityMap.getOrDefault(itemId, 0) + quantity);
                
                // Tính revenue (quantity * price)
                Item item = itemServices.getById(itemId);
                if (item != null && item.getPrice() != null) {
                    int revenue = quantity * item.getPrice().intValue();
                    itemRevenueMap.put(itemId, itemRevenueMap.getOrDefault(itemId, 0) + revenue);
                }
            }
            
            // Chuyển thành list và sort theo quantity giảm dần
            List<Map<String, Object>> topDishes = new ArrayList<>();
            
            itemQuantityMap.entrySet().stream()
                .sorted(Map.Entry.<Integer, Integer>comparingByValue().reversed())
                .limit(limit)
                .forEach(entry -> {
                    Integer itemId = entry.getKey();
                    Integer totalQuantity = entry.getValue();
                    Integer totalRevenue = itemRevenueMap.getOrDefault(itemId, 0);
                    
                    Item item = itemServices.getById(itemId);
                    if (item != null) {
                        Map<String, Object> dish = new HashMap<>();
                        dish.put("itemId", itemId);
                        dish.put("name", item.getName());
                        dish.put("quantity", totalQuantity);
                        dish.put("revenue", totalRevenue);
                        topDishes.add(dish);
                    }
                });
            
            return topDishes;
        } catch (Exception e) {
            // Trả về empty list nếu có lỗi
            return new ArrayList<>();
        }
    }

    public boolean delete(Integer id) {
        Optional<Menu> existingOptional = menuRepository.findById(id);
        if (existingOptional.isEmpty()) {
            return false;
        }

        menuRepository.deleteById(id);
        return true;
    }
}
