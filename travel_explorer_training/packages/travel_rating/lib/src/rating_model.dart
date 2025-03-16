// lib/src/rating_model.dart
class RatingModel {
  final double value;
  final int totalRatings;
  final DateTime lastUpdated;
  final List<RatingCriteria>? criteria;

  RatingModel({
    required this.value,
    this.totalRatings = 0,
    DateTime? lastUpdated,
    this.criteria,
  }) : lastUpdated = lastUpdated ?? DateTime.now();

  factory RatingModel.empty() {
    return RatingModel(value: 0.0);
  }

  RatingModel copyWith({
    double? value,
    int? totalRatings,
    DateTime? lastUpdated,
    List<RatingCriteria>? criteria,
  }) {
    return RatingModel(
      value: value ?? this.value,
      totalRatings: totalRatings ?? this.totalRatings,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      criteria: criteria ?? this.criteria,
    );
  }
}

class RatingCriteria {
  final String name;
  final double value;
  final double weight;

  const RatingCriteria({
    required this.name,
    required this.value,
    this.weight = 1.0,
  });
}
