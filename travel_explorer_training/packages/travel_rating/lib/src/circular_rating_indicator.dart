// lib/src/circular_rating_indicator.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'rating_model.dart';

class CircularRatingIndicator extends StatelessWidget {
  final double rating;
  final double size;
  final Color backgroundColor;
  final Color foregroundColor;
  final double strokeWidth;
  final Widget? child;
  final RatingModel? ratingModel;

  const CircularRatingIndicator({
    super.key,
    required this.rating,
    this.size = 60.0,
    this.backgroundColor = Colors.grey,
    this.foregroundColor = Colors.amber,
    this.strokeWidth = 8.0,
    this.child,
    this.ratingModel,
  });

  /// Create from a rating model
  factory CircularRatingIndicator.fromModel({
    required RatingModel model,
    double size = 60.0,
    Color backgroundColor = Colors.grey,
    Color foregroundColor = Colors.amber,
    double strokeWidth = 8.0,
    Widget? child,
  }) {
    return CircularRatingIndicator(
      rating: model.value,
      size: size,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      strokeWidth: strokeWidth,
      child: child,
      ratingModel: model,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Rating circle
          CustomPaint(
            painter: _CircularRatingPainter(
              rating: rating,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              strokeWidth: strokeWidth,
            ),
            size: Size(size, size),
          ),
          // Child widget (usually text showing the rating)
          if (child != null) child!,
        ],
      ),
    );
  }
}

class _CircularRatingPainter extends CustomPainter {
  final double rating;
  final double maxRating;
  final Color backgroundColor;
  final Color foregroundColor;
  final double strokeWidth;

  _CircularRatingPainter({
    required this.rating,
    this.maxRating = 5.0,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - strokeWidth / 2;
    
    // Paint for background circle
    final backgroundPaint = Paint()
      ..color = backgroundColor.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    
    // Paint for rating arc
    final ratingPaint = Paint()
      ..color = foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    
    // Draw background circle
    canvas.drawCircle(center, radius, backgroundPaint);
    
    // Draw rating arc
    final ratingAngle = 2 * pi * (rating / maxRating);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // Start from top
      ratingAngle,
      false,
      ratingPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}