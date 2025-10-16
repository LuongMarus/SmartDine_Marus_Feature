package com.smartdine.service;

import com.smartdine.model.Notification;
import com.smartdine.repository.NotificationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class NotificationService {
    
    private final NotificationRepository notificationRepository;
    
    public List<Notification> getAllNotifications() {
        return notificationRepository.findAllByOrderByCreatedAtDesc();
    }
    
    public Optional<Notification> getNotificationById(String id) {
        return notificationRepository.findById(id);
    }
    
    public List<Notification> getUnreadNotifications() {
        return notificationRepository.findByIsReadOrderByCreatedAtDesc(false);
    }
    
    public Long getUnreadCount() {
        return notificationRepository.countByIsRead(false);
    }
    
    @Transactional
    public Notification createNotification(Notification notification) {
        return notificationRepository.save(notification);
    }
    
    @Transactional
    public Notification markAsRead(String id) {
        Notification notification = notificationRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Notification not found with id: " + id));
        notification.setIsRead(true);
        return notificationRepository.save(notification);
    }
    
    @Transactional
    public void markAllAsRead() {
        List<Notification> unreadNotifications = getUnreadNotifications();
        unreadNotifications.forEach(n -> n.setIsRead(true));
        notificationRepository.saveAll(unreadNotifications);
    }
    
    @Transactional
    public void deleteNotification(String id) {
        notificationRepository.deleteById(id);
    }
    
    public List<Notification> getNotificationsByBranch(String branchId) {
        return notificationRepository.findByBranchIdOrderByCreatedAtDesc(branchId);
    }
    
    @Transactional
    public Notification createOrderNotification(String orderId, String branchId, String title, String message) {
        Notification notification = new Notification();
        notification.setType(Notification.NotificationType.ORDER_UPDATE);
        notification.setOrderId(orderId);
        notification.setBranchId(branchId);
        notification.setTitle(title);
        notification.setMessage(message);
        notification.setIsRead(false);
        return notificationRepository.save(notification);
    }
    
    @Transactional
    public Notification createBranchNotification(String branchId, String title, String message) {
        Notification notification = new Notification();
        notification.setType(Notification.NotificationType.BRANCH_ALERT);
        notification.setBranchId(branchId);
        notification.setTitle(title);
        notification.setMessage(message);
        notification.setIsRead(false);
        return notificationRepository.save(notification);
    }
}
