package com.smartdine.service;

import com.smartdine.model.Branch;
import com.smartdine.repository.BranchRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BranchService {
    
    private final BranchRepository branchRepository;
    
    public List<Branch> getAllBranches() {
        return branchRepository.findAll();
    }
    
    public Optional<Branch> getBranchById(String id) {
        return branchRepository.findById(id);
    }
    
    @Transactional
    public Branch createBranch(Branch branch) {
        return branchRepository.save(branch);
    }
    
    @Transactional
    public Branch updateBranch(String id, Branch branchDetails) {
        Branch branch = branchRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Branch not found with id: " + id));
        
        branch.setName(branchDetails.getName());
        branch.setAddress(branchDetails.getAddress());
        branch.setPhone(branchDetails.getPhone());
        branch.setEmail(branchDetails.getEmail());
        branch.setManager(branchDetails.getManager());
        branch.setStatus(branchDetails.getStatus());
        branch.setMetadata(branchDetails.getMetadata());
        
        return branchRepository.save(branch);
    }
    
    @Transactional
    public void deleteBranch(String id) {
        branchRepository.deleteById(id);
    }
    
    public List<Branch> getBranchesByStatus(Branch.BranchStatus status) {
        return branchRepository.findByStatus(status);
    }
    
    public List<Branch> searchBranches(String name) {
        return branchRepository.findByNameContainingIgnoreCase(name);
    }
}
