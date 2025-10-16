class Analytics {
  final String branchId;
  final AnalyticsPeriod period;
  final double totalRevenue;
  final int totalOrders;
  final double averageOrderValue;
  final Map<String, int> ordersByStatus;
  final Map<String, double> revenueByDay;
  final List<TopItem> topSellingItems;
  final double customerSatisfaction;
  final DateTime generatedAt;

  Analytics({
    required this.branchId,
    required this.period,
    required this.totalRevenue,
    required this.totalOrders,
    required this.averageOrderValue,
    required this.ordersByStatus,
    required this.revenueByDay,
    required this.topSellingItems,
    required this.customerSatisfaction,
    required this.generatedAt,
  });

  factory Analytics.fromJson(Map<String, dynamic> json) {
    return Analytics(
      branchId: json['branchId'] as String,
      period: AnalyticsPeriod.values.firstWhere(
        (e) => e.toString().split('.').last == json['period'],
        orElse: () => AnalyticsPeriod.daily,
      ),
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      totalOrders: json['totalOrders'] as int,
      averageOrderValue: (json['averageOrderValue'] as num).toDouble(),
      ordersByStatus: Map<String, int>.from(json['ordersByStatus'] as Map),
      revenueByDay: (json['revenueByDay'] as Map)
          .map((key, value) => MapEntry(key as String, (value as num).toDouble())),
      topSellingItems: (json['topSellingItems'] as List)
          .map((item) => TopItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      customerSatisfaction: (json['customerSatisfaction'] as num).toDouble(),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'branchId': branchId,
      'period': period.toString().split('.').last,
      'totalRevenue': totalRevenue,
      'totalOrders': totalOrders,
      'averageOrderValue': averageOrderValue,
      'ordersByStatus': ordersByStatus,
      'revenueByDay': revenueByDay,
      'topSellingItems': topSellingItems.map((item) => item.toJson()).toList(),
      'customerSatisfaction': customerSatisfaction,
      'generatedAt': generatedAt.toIso8601String(),
    };
  }
}

class TopItem {
  final String itemId;
  final String name;
  final int quantitySold;
  final double revenue;

  TopItem({
    required this.itemId,
    required this.name,
    required this.quantitySold,
    required this.revenue,
  });

  factory TopItem.fromJson(Map<String, dynamic> json) {
    return TopItem(
      itemId: json['itemId'] as String,
      name: json['name'] as String,
      quantitySold: json['quantitySold'] as int,
      revenue: (json['revenue'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'itemId': itemId,
      'name': name,
      'quantitySold': quantitySold,
      'revenue': revenue,
    };
  }
}

enum AnalyticsPeriod {
  daily,
  weekly,
  monthly,
  yearly,
}
