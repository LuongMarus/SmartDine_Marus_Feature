package com.smartdine.controller;

import com.smartdine.model.Branch;
import com.smartdine.service.BranchService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/branches")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class BranchController {
    
    private final BranchService branchService;
    
    @GetMapping
    public ResponseEntity<List<Branch>> getAllBranches(
            @RequestParam(required = false) String status) {
        if (status != null) {
            Branch.BranchStatus branchStatus = Branch.BranchStatus.valueOf(status.toUpperCase());
            return ResponseEntity.ok(branchService.getBranchesByStatus(branchStatus));
        }
        return ResponseEntity.ok(branchService.getAllBranches());
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Branch> getBranchById(@PathVariable String id) {
        return branchService.getBranchById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @PostMapping
    public ResponseEntity<Branch> createBranch(@RequestBody Branch branch) {
        Branch createdBranch = branchService.createBranch(branch);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdBranch);
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<Branch> updateBranch(
            @PathVariable String id,
            @RequestBody Branch branch) {
        try {
            Branch updatedBranch = branchService.updateBranch(id, branch);
            return ResponseEntity.ok(updatedBranch);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBranch(@PathVariable String id) {
        branchService.deleteBranch(id);
        return ResponseEntity.noContent().build();
    }
    
    @GetMapping("/search")
    public ResponseEntity<List<Branch>> searchBranches(@RequestParam String name) {
        return ResponseEntity.ok(branchService.searchBranches(name));
    }
}
