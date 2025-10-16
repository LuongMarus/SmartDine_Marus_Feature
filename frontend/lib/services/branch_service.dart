import '../models/branch.dart';
import 'api_service.dart';

class BranchService {
  final ApiService _apiService = ApiService();

  Future<List<Branch>> getAllBranches() async {
    try {
      final response = await _apiService.get('/branches');
      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => Branch.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to fetch branches: $e');
    }
  }

  Future<Branch> getBranchById(String id) async {
    try {
      final response = await _apiService.get('/branches/$id');
      return Branch.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to fetch branch: $e');
    }
  }

  Future<Branch> createBranch(Branch branch) async {
    try {
      final response = await _apiService.post('/branches', data: branch.toJson());
      return Branch.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to create branch: $e');
    }
  }

  Future<Branch> updateBranch(String id, Branch branch) async {
    try {
      final response = await _apiService.put('/branches/$id', data: branch.toJson());
      return Branch.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to update branch: $e');
    }
  }

  Future<void> deleteBranch(String id) async {
    try {
      await _apiService.delete('/branches/$id');
    } catch (e) {
      throw Exception('Failed to delete branch: $e');
    }
  }

  Future<List<Branch>> getBranchesByStatus(BranchStatus status) async {
    try {
      final response = await _apiService.get(
        '/branches',
        queryParameters: {'status': status.toString().split('.').last},
      );
      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => Branch.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to fetch branches by status: $e');
    }
  }
}
