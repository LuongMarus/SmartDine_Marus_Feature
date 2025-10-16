import '../models/analytics.dart';
import 'api_service.dart';

class AnalyticsService {
  final ApiService _apiService = ApiService();

  Future<Analytics> getAnalytics(String branchId, AnalyticsPeriod period) async {
    try {
      final response = await _apiService.get(
        '/analytics/$branchId',
        queryParameters: {'period': period.toString().split('.').last},
      );
      return Analytics.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to fetch analytics: $e');
    }
  }

  Future<Map<String, dynamic>> getDashboardStats(String branchId) async {
    try {
      final response = await _apiService.get('/analytics/$branchId/dashboard');
      return response.data as Map<String, dynamic>;
    } catch (e) {
      throw Exception('Failed to fetch dashboard stats: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getRevenueChart(
    String branchId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final response = await _apiService.get(
        '/analytics/$branchId/revenue',
        queryParameters: {
          'startDate': startDate.toIso8601String(),
          'endDate': endDate.toIso8601String(),
        },
      );
      return List<Map<String, dynamic>>.from(response.data as List);
    } catch (e) {
      throw Exception('Failed to fetch revenue chart: $e');
    }
  }

  Future<List<TopItem>> getTopSellingItems(String branchId, {int limit = 10}) async {
    try {
      final response = await _apiService.get(
        '/analytics/$branchId/top-items',
        queryParameters: {'limit': limit},
      );
      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => TopItem.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to fetch top selling items: $e');
    }
  }
}
