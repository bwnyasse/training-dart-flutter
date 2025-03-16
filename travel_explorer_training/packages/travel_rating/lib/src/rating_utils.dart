// lib/src/rating_utils.dart
import 'rating_model.dart';

class RatingUtils {
  /// Calculate weighted average of multiple ratings
  static double calculateWeightedRating(List<RatingCriteria> criteria) {
    if (criteria.isEmpty) return 0.0;
    
    double totalWeight = 0.0;
    double weightedSum = 0.0;
    
    for (final criterion in criteria) {
      totalWeight += criterion.weight;
      weightedSum += criterion.value * criterion.weight;
    }
    
    return totalWeight > 0 ? weightedSum / totalWeight : 0.0;
  }
  
  /// Combine a new rating with existing rating model
  static RatingModel addRating(RatingModel current, double newRating) {
    final totalRatings = current.totalRatings + 1;
    final totalValue = current.value * current.totalRatings + newRating;
    final newValue = totalValue / totalRatings;
    
    return current.copyWith(
      value: newValue,
      totalRatings: totalRatings,
      lastUpdated: DateTime.now(),
    );
  }
  
  /// Get descriptive text for rating value
  static String getRatingDescription(double rating) {
    if (rating >= 4.5) return 'Excellent';
    if (rating >= 4.0) return 'Very Good';
    if (rating >= 3.0) return 'Good';
    if (rating >= 2.0) return 'Fair';
    return 'Poor';
  }
  
  /// Format rating for display
  static String formatRating(double rating, {int decimalPlaces = 1}) {
    return rating.toStringAsFixed(decimalPlaces);
  }
}