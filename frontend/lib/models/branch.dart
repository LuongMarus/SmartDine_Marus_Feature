class Branch {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String manager;
  final BranchStatus status;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final Map<String, dynamic>? metadata;

  Branch({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.manager,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  factory Branch.fromJson(Map<String, dynamic> json) {
    return Branch(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      manager: json['manager'] as String,
      status: BranchStatus.values.firstWhere(
        (e) => e.toString().split('.').last == json['status'],
        orElse: () => BranchStatus.active,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone': phone,
      'email': email,
      'manager': manager,
      'status': status.toString().split('.').last,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'metadata': metadata,
    };
  }

  Branch copyWith({
    String? id,
    String? name,
    String? address,
    String? phone,
    String? email,
    String? manager,
    BranchStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? metadata,
  }) {
    return Branch(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      manager: manager ?? this.manager,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      metadata: metadata ?? this.metadata,
    );
  }
}

enum BranchStatus {
  active,
  inactive,
  maintenance,
}
