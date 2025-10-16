package com.smartdine.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Entity
@Table(name = "notifications")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notification {
    
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private String id;
    
    @Column(nullable = false)
    private String title;
    
    @Column(nullable = false, length = 1000)
    private String message;
    
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private NotificationType type;
    
    private String branchId;
    
    private String orderId;
    
    @Column(nullable = false)
    private Boolean isRead = false;
    
    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;
    
    @ElementCollection
    @CollectionTable(name = "notification_data", joinColumns = @JoinColumn(name = "notification_id"))
    @MapKeyColumn(name = "data_key")
    @Column(name = "data_value")
    private Map<String, String> data = new HashMap<>();
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        if (isRead == null) {
            isRead = false;
        }
    }
    
    public enum NotificationType {
        GENERAL, ORDER_UPDATE, BRANCH_ALERT, SYSTEM_NOTICE
    }
}
