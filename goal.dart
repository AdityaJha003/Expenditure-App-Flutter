class Goal {
  final String id;
  final String description;
  final double targetAmount;
  final double currentAmount;

  Goal({
    required this.id,
    required this.description,
    required this.targetAmount,
    required this.currentAmount,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'targetAmount': targetAmount,
      'currentAmount': currentAmount,
    };
  }

  factory Goal.fromMap(Map<String, dynamic> map) {
    return Goal(
      id: map['id'],
      description: map['description'],
      targetAmount: map['targetAmount'],
      currentAmount: map['currentAmount'],
    );
  }
}
