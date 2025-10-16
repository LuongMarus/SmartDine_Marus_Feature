package com.smartdine.repository;

import com.smartdine.model.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, String> {
    List<Notification> findByIsReadOrderByCreatedAtDesc(Boolean isRead);
    List<Notification> findByBranchIdOrderByCreatedAtDesc(String branchId);
    Long countByIsRead(Boolean isRead);
    List<Notification> findAllByOrderByCreatedAtDesc();
}
