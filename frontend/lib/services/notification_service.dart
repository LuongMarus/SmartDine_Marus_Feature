import '../models/notification.dart';
import 'api_service.dart';

class NotificationService {
  final ApiService _apiService = ApiService();

  Future<List<AppNotification>> getAllNotifications() async {
    try {
      final response = await _apiService.get('/notifications');
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => AppNotification.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch notifications: $e');
    }
  }

  Future<List<AppNotification>> getUnreadNotifications() async {
    try {
      final response = await _apiService.get(
        '/notifications',
        queryParameters: {'isRead': false},
      );
      final List<dynamic> data = response.data as List<dynamic>;
      return data
          .map((json) => AppNotification.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch unread notifications: $e');
    }
  }

  Future<AppNotification> markAsRead(String id) async {
    try {
      final response = await _apiService.put('/notifications/$id/read');
      return AppNotification.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('Failed to mark notification as read: $e');
    }
  }

  Future<void> markAllAsRead() async {
    try {
      await _apiService.put('/notifications/read-all');
    } catch (e) {
      throw Exception('Failed to mark all notifications as read: $e');
    }
  }

  Future<void> deleteNotification(String id) async {
    try {
      await _apiService.delete('/notifications/$id');
    } catch (e) {
      throw Exception('Failed to delete notification: $e');
    }
  }

  Future<int> getUnreadCount() async {
    try {
      final response = await _apiService.get('/notifications/unread-count');
      return response.data['count'] as int;
    } catch (e) {
      throw Exception('Failed to fetch unread count: $e');
    }
  }
}
