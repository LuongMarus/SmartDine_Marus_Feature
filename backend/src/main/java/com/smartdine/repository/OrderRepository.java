package com.smartdine.repository;

import com.smartdine.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, String> {
    List<Order> findByBranchId(String branchId);
    List<Order> findByStatus(Order.OrderStatus status);
    List<Order> findByCustomerId(String customerId);
    List<Order> findByBranchIdAndStatus(String branchId, Order.OrderStatus status);
}
