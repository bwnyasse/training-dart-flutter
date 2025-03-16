// lib/src/star_rating_input.dart
import 'package:flutter/material.dart';
import 'rating_model.dart';

class StarRatingInput extends StatefulWidget {
  final double initialRating;
  final ValueChanged<double> onRatingChanged;
  final int starCount;
  final Color activeColor;
  final Color inactiveColor;
  final double size;
  final bool allowHalfRating;
  final IconData filledIcon;
  final IconData halfFilledIcon;
  final IconData emptyIcon;

  const StarRatingInput({
    super.key,
    this.initialRating = 0.0,
    required this.onRatingChanged,
    this.starCount = 5,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
    this.size = 24.0,
    this.allowHalfRating = true,
    this.filledIcon = Icons.star,
    this.halfFilledIcon = Icons.star_half,
    this.emptyIcon = Icons.star_border,
  });

  factory StarRatingInput.fromModel({
    required RatingModel model,
    required ValueChanged<double> onRatingChanged,
    int starCount = 5,
    Color activeColor = Colors.amber,
    Color inactiveColor = Colors.grey,
    double size = 24.0,
    bool allowHalfRating = true,
  }) {
    return StarRatingInput(
      initialRating: model.value,
      onRatingChanged: onRatingChanged,
      starCount: starCount,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      size: size,
      allowHalfRating: allowHalfRating,
    );
  }

  @override
  State<StarRatingInput> createState() => _StarRatingInputState();
}

class _StarRatingInputState extends State<StarRatingInput> {
  late double _rating;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _rating = index + 1.0;
              widget.onRatingChanged(_rating);
            });
          },
          onHorizontalDragUpdate: widget.allowHalfRating
              ? (details) {
                  final RenderBox box = context.findRenderObject() as RenderBox;
                  final localPosition = box.globalToLocal(details.globalPosition);
                  final starWidth = box.size.width / widget.starCount;
                  final starIndex = localPosition.dx ~/ starWidth;
                  
                  if (starIndex < 0) {
                    _updateRating(0);
                  } else if (starIndex >= widget.starCount) {
                    _updateRating(widget.starCount.toDouble());
                  } else {
                    final starCenterX = starWidth * (starIndex + 0.5);
                    final position = localPosition.dx - starWidth * starIndex;
                    final halfStar = position < (starWidth / 2);
                    _updateRating(
                      starIndex + (halfStar ? 0.5 : 1.0),
                    );
                  }
                }
              : null,
          child: Icon(
            _getIconData(index + 1),
            color: _getColor(index + 1),
            size: widget.size,
          ),
        );
      }),
    );
  }

  void _updateRating(double rating) {
    setState(() {
      _rating = rating;
      widget.onRatingChanged(_rating);
    });
  }

  IconData _getIconData(int index) {
    if (index <= _rating.floor()) {
      return widget.filledIcon;
    } else if (index - 0.5 == _rating) {
      return widget.halfFilledIcon;
    } else {
      return widget.emptyIcon;
    }
  }

  Color _getColor(int index) {
    if (index <= _rating) {
      return widget.activeColor;
    } else if (index - 0.5 == _rating) {
      return widget.activeColor;
    } else {
      return widget.inactiveColor;
    }
  }
}