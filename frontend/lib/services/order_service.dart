import '../models/order.dart';
import 'api_service.dart';

class OrderService {
  final ApiService _apiService = ApiService();

  Future<List<Order>> getAllOrders() async {
    try {
      final response = await _apiService.get('/orders');
      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => Order.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to fetch orders: $e');
    }
  }

  Future<Order> getOrderById(String id) async {
    try {
      final response = await _apiService.get('/orders/$id');
      return Order.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to fetch order: $e');
    }
  }

  Future<Order> createOrder(Order order) async {
    try {
      final response = await _apiService.post('/orders', data: order.toJson());
      return Order.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to create order: $e');
    }
  }

  Future<Order> updateOrderStatus(String id, OrderStatus status) async {
    try {
      final response = await _apiService.put(
        '/orders/$id/status',
        data: {'status': status.toString().split('.').last},
      );
      return Order.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to update order status: $e');
    }
  }

  Future<List<Order>> getOrdersByBranch(String branchId) async {
    try {
      final response = await _apiService.get(
        '/orders',
        queryParameters: {'branchId': branchId},
      );
      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => Order.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to fetch orders by branch: $e');
    }
  }

  Future<List<Order>> getOrdersByStatus(OrderStatus status) async {
    try {
      final response = await _apiService.get(
        '/orders',
        queryParameters: {'status': status.toString().split('.').last},
      );
      final List<dynamic> data = response.data as List<dynamic>;
      return data.map((json) => Order.fromJson(json as Map<String, dynamic>)).toList();
    } catch (e) {
      throw Exception('Failed to fetch orders by status: $e');
    }
  }

  Future<void> cancelOrder(String id) async {
    try {
      await _apiService.delete('/orders/$id');
    } catch (e) {
      throw Exception('Failed to cancel order: $e');
    }
  }
}
