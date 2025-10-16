package com.smartdine.service;

import com.smartdine.model.Order;
import com.smartdine.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class OrderService {
    
    private final OrderRepository orderRepository;
    private final NotificationService notificationService;
    
    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }
    
    public Optional<Order> getOrderById(String id) {
        return orderRepository.findById(id);
    }
    
    @Transactional
    public Order createOrder(Order order) {
        Order savedOrder = orderRepository.save(order);
        
        // Send notification for new order
        notificationService.createOrderNotification(
            savedOrder.getId(),
            savedOrder.getBranchId(),
            "New Order Received",
            String.format("Order #%s from %s", 
                savedOrder.getId().substring(0, 8), 
                savedOrder.getCustomerName())
        );
        
        return savedOrder;
    }
    
    @Transactional
    public Order updateOrderStatus(String id, Order.OrderStatus status) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found with id: " + id));
        
        order.setStatus(status);
        Order updatedOrder = orderRepository.save(order);
        
        // Send notification for status update
        notificationService.createOrderNotification(
            order.getId(),
            order.getBranchId(),
            "Order Status Updated",
            String.format("Order #%s is now %s", 
                order.getId().substring(0, 8), 
                status.toString().toLowerCase())
        );
        
        return updatedOrder;
    }
    
    @Transactional
    public void cancelOrder(String id) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found with id: " + id));
        order.setStatus(Order.OrderStatus.CANCELLED);
        orderRepository.save(order);
    }
    
    public List<Order> getOrdersByBranch(String branchId) {
        return orderRepository.findByBranchId(branchId);
    }
    
    public List<Order> getOrdersByStatus(Order.OrderStatus status) {
        return orderRepository.findByStatus(status);
    }
    
    public List<Order> getOrdersByCustomer(String customerId) {
        return orderRepository.findByCustomerId(customerId);
    }
    
    public List<Order> getOrdersByBranchAndStatus(String branchId, Order.OrderStatus status) {
        return orderRepository.findByBranchIdAndStatus(branchId, status);
    }
}
