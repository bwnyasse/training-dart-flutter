// lib/shared/widgets/decorations/fancy_card.dart
import 'package:flutter/material.dart';

class FancyCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final List<Color> gradientColors;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  const FancyCard({
    super.key,
    required this.child,
    this.borderRadius = 16.0,
    this.gradientColors = const [Colors.blue, Colors.purple],
    this.height,
    this.width,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: gradientColors.first.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}