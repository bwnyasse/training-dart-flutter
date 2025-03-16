// lib/shared/widgets/rotated_label.dart
import 'package:flutter/material.dart';

class VerticalLabel extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color backgroundColor;
  final double padding;

  const VerticalLabel({
    super.key,
    required this.text,
    this.style,
    this.backgroundColor = Colors.transparent,
    this.padding = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).textTheme.titleMedium;
    final textStyle = style ?? defaultStyle?.copyWith(
      fontWeight: FontWeight.bold,
    );

    return Container(
      padding: EdgeInsets.all(padding),
      color: backgroundColor,
      child: RotatedBox(
        quarterTurns: 3, // Rotate 270 degrees (counter-clockwise)
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}

class NewBadge extends StatelessWidget {
  final double size;
  final Color color;
  
  const NewBadge({
    super.key,
    this.size = 60.0,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1, // 90 degrees clockwise
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          // Create a triangle shape
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(4.0),
          ),
        ),
        child: const RotatedBox(
          quarterTurns: -1, // -90 degrees to make text horizontal again
          child: Text(
            'NEW',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}