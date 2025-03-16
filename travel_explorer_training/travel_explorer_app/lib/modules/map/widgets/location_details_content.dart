// lib/modules/map/widgetslocation_details_content.dart
import 'package:flutter/material.dart';
import 'package:travel_explorer/shared/models/location_model.dart';
import 'package:travel_explorer/shared/widgets/custom_painters/circular_rating_painter.dart';
import 'package:travel_explorer/shared/widgets/decorations/fancy_card.dart';
import 'package:travel_explorer/shared/widgets/glass_container.dart';
import 'package:travel_explorer/shared/widgets/rotated_label.dart';

class LocationDetailsContent extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FancyCard(
          gradientColors: _getGradientForType(location.type),
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image section with glass overlay for details
              Stack(
                children: [
                  // Location image
                  if (location.imageUrl != null)
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      child: Image.network(
                        location.imageUrl!,
                        height: 450,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  else
                    Container(
                      height: 180,
                      color: _getColorForType(location.type).withOpacity(0.3),
                      child: Center(
                        child: Icon(
                          _getIconForType(location.type),
                          size: 60,
                          color: _getColorForType(location.type),
                        ),
                      ),
                    ),
                    
                  // Category badge
                  Positioned(
                    left: 0,
                    top: 20,
                    child: VerticalLabel(
                      text: location.type.toString().split('.').last.toUpperCase(),
                      backgroundColor: _getColorForType(location.type),
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
                              location.name,
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
                          if (location.rating != null)
                            CircularRatingIndicator(
                              rating: location.rating!,
                              size: 50.0,
                              strokeWidth: 3.0,
                              foregroundColor: Colors.amber,
                              backgroundColor: Colors.white54,
                              child: Text(
                                location.rating!.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                              ),
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
                    if (location.description != null) ...[
                      Text(
                        location.description!,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                    
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
                          onPressed: onAddToTrip,
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
        if (isNew)
          const Positioned(
            top: 0,
            right: 0,
            child: NewBadge(),
          ),
      ],
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