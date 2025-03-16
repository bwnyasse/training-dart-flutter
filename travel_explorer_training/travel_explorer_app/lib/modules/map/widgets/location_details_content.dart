// lib/modules/map/widgets/location_details_content.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_explorer/modules/genai/bloc/genai_bloc.dart';
import 'package:travel_explorer/modules/genai/bloc/genai_event.dart';
import 'package:travel_explorer/modules/genai/bloc/genai_state.dart';
import 'package:travel_explorer/shared/models/location_model.dart';
import 'package:travel_explorer/shared/widgets/decorations/fancy_card.dart';
import 'package:travel_explorer/shared/widgets/glass_container.dart';
import 'package:travel_explorer/shared/widgets/rotated_label.dart';
import 'package:travel_rating/travel_rating.dart';

class LocationDetailsContent extends StatefulWidget {
  final LocationModel location;
  final VoidCallback? onAddToTrip;
  final bool isNew;

  const LocationDetailsContent({
    super.key,
    required this.location,
    this.onAddToTrip,
    this.isNew = false,
  });

  @override
  State<LocationDetailsContent> createState() => _LocationDetailsContentState();
}

class _LocationDetailsContentState extends State<LocationDetailsContent> {
  late final GenAIBloc _genAIBloc;

  @override
  void initState() {
    super.initState();
    _genAIBloc = BlocProvider.of<GenAIBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    RatingModel locationRating = RatingModel(
      value: widget.location.rating ?? 0.0,
      totalRatings: 42, // Example value
    );

    return BlocProvider.value(
      value: _genAIBloc,
      child: Stack(
        children: [
          FancyCard(
            gradientColors: _getGradientForType(widget.location.type),
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image section with glass overlay for details
                Stack(
                  children: [
                    // Location image
                    if (widget.location.imageUrl != null)
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16.0),
                        ),
                        child: Image.network(
                          widget.location.imageUrl!,
                          height: 450,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    else
                      Container(
                        height: 180,
                        color: _getColorForType(widget.location.type)
                            .withOpacity(0.3),
                        child: Center(
                          child: Icon(
                            _getIconForType(widget.location.type),
                            size: 60,
                            color: _getColorForType(widget.location.type),
                          ),
                        ),
                      ),

                    // Category badge
                    Positioned(
                      left: 0,
                      top: 20,
                      child: VerticalLabel(
                        text: widget.location.type
                            .toString()
                            .split('.')
                            .last
                            .toUpperCase(),
                        backgroundColor: _getColorForType(widget.location.type),
                        padding: 12,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Glass effect info bar at bottom of image
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: GlassContainer(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        borderRadius: 0,
                        blurAmount: 3,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.location.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black45,
                                      blurRadius: 2,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (widget.location.rating != null)
                              CircularRatingIndicator.fromModel(
                                model: locationRating,
                                size: 80.0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      RatingUtils.formatRating(
                                          locationRating.value),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      RatingUtils.getRatingDescription(
                                          locationRating.value),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            // Using StarRatingInput
                            StarRatingInput.fromModel(
                              model: locationRating,
                              onRatingChanged: (value) {
                                // Handle rating change
                                print('New rating: $value');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Details section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.location.description != null) ...[
                        Text(
                          widget.location.description!,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                      BlocBuilder<GenAIBloc, GenAIState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'AI Travel Insight',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  if (state.status != GenAIStatus.loading)
                                    IconButton(
                                      icon: const Icon(Icons.psychology,
                                          color: Colors.white),
                                      onPressed: () {
                                        _genAIBloc.add(
                                          GenerateLocationDescription(
                                            locationName:
                                                widget.location.name,
                                            locationType: widget.location.type
                                                .toString()
                                                .split('.')
                                                .last,
                                          ),
                                        );
                                      },
                                      tooltip: 'Generate AI description',
                                    ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              if (state.status == GenAIStatus.loading)
                                const Center(
                                  child: CircularProgressIndicator(),
                                )
                              else if (state.status == GenAIStatus.success &&
                                  state.description != null)
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.white24),
                                  ),
                                  child: Text(
                                    state.description!,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                )
                              else if (state.status == GenAIStatus.error)
                                Text(
                                  'Error: ${state.errorMessage}',
                                  style: const TextStyle(
                                      color: Colors.redAccent),
                                )
                              else
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.white12),
                                  ),
                                  child: const Text(
                                    'Tap the AI icon to generate a travel insight about this location.',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                      // Action buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildActionButton(
                            icon: Icons.map,
                            label: 'View on Map',
                            onPressed: () {
                              // Already on map for now
                            },
                          ),
                          _buildActionButton(
                            icon: Icons.add,
                            label: 'Add to Trip',
                            onPressed: widget.onAddToTrip,
                          ),
                          _buildActionButton(
                            icon: Icons.favorite_border,
                            label: 'Favorite',
                            onPressed: () {
                              // To be implemented
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // NEW badge if applicable
          if (widget.isNew)
            const Positioned(
              top: 0,
              right: 0,
              child: NewBadge(),
            ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback? onPressed,
  }) {
    return Opacity(
      opacity: onPressed != null ? 1.0 : 0.5,
      child: TextButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Color _getColorForType(LocationType type) {
    switch (type) {
      case LocationType.restaurant:
        return Colors.redAccent;
      case LocationType.hotel:
        return Colors.blueAccent;
      case LocationType.attraction:
        return Colors.greenAccent;
      case LocationType.landmark:
        return Colors.purpleAccent;
      case LocationType.other:
        return Colors.orangeAccent;
    }
  }

  IconData _getIconForType(LocationType type) {
    switch (type) {
      case LocationType.restaurant:
        return Icons.restaurant;
      case LocationType.hotel:
        return Icons.hotel;
      case LocationType.attraction:
        return Icons.attractions;
      case LocationType.landmark:
        return Icons.location_city;
      case LocationType.other:
        return Icons.place;
    }
  }

  List<Color> _getGradientForType(LocationType type) {
    final baseColor = _getColorForType(type);
    return [
      baseColor,
      baseColor.withBlue((baseColor.blue + 50) % 255),
    ];
  }
}
