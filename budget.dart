class Budget {
  final String id;
  final String category;
  final double limit;
  final double spent;

  Budget({
    required this.id,
    required this.category,
    required this.limit,
    required this.spent,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category,
      'limit': limit,
      'spent': spent,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      id: map['id'],
      category: map['category'],
      limit: map['limit'],
      spent: map['spent'],
    );
  }
}
