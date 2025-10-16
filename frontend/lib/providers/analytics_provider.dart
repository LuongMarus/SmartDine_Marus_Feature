import 'package:flutter/foundation.dart';
import '../models/analytics.dart';
import '../services/analytics_service.dart';

class AnalyticsProvider extends ChangeNotifier {
  final AnalyticsService _analyticsService = AnalyticsService();
  Analytics? _analytics;
  Map<String, dynamic>? _dashboardStats;
  List<TopItem> _topSellingItems = [];
  bool _isLoading = false;
  String? _error;

  Analytics? get analytics => _analytics;
  Map<String, dynamic>? get dashboardStats => _dashboardStats;
  List<TopItem> get topSellingItems => _topSellingItems;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadAnalytics(String branchId, AnalyticsPeriod period) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _analytics = await _analyticsService.getAnalytics(branchId, period);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadDashboardStats(String branchId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _dashboardStats = await _analyticsService.getDashboardStats(branchId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadTopSellingItems(String branchId, {int limit = 10}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _topSellingItems = await _analyticsService.getTopSellingItems(branchId, limit: limit);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearAnalytics() {
    _analytics = null;
    _dashboardStats = null;
    _topSellingItems = [];
    notifyListeners();
  }
}
