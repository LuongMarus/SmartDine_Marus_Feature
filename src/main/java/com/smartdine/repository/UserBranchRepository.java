package com.smartdine.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.smartdine.models.UserBranch;

public interface UserBranchRepository extends JpaRepository<UserBranch, Integer> {
    UserBranch findTopByUserIdOrderByAssignedAtDesc(Integer userId);

    List<UserBranch> findByBranchId(Integer branchId);

    // Xóa userId
    long deleteByUserId(Integer userId);
}
