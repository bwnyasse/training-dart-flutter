import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travel_explorer/modules/map/bloc/map_bloc.dart';
import 'package:travel_explorer/modules/map/bloc/map_event.dart';
import 'package:travel_explorer/modules/map/bloc/map_state.dart';
import 'package:travel_explorer/modules/map/widgets/location_details_content.dart';
import 'package:travel_explorer/shared/animations/animation_utils.dart';
import 'package:travel_explorer/shared/models/location_model.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final MapBloc _mapBloc;

  @override
  void initState() {
    super.initState();
    _mapBloc = BlocProvider.of<MapBloc>(context);
    _mapBloc.add(LoadLocations());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _mapBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Explore Map'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            if (state.status == MapStatus.initial ||
                state.status == MapStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == MapStatus.error) {
              return Center(
                  child: Text(state.errorMessage ?? 'An error occurred'));
            }

            return Column(
              children: [
                // Main content area
                Expanded(
                  child: Row(
                    children: [
                      // Map view
                      Expanded(
                        flex: 3, // Takes more space
                        child: Stack(
                          children: [
                            // Map
                            GoogleMap(
                              initialCameraPosition: state.cameraPosition!,
                              markers: state.markers,
                              myLocationEnabled: true,
                              myLocationButtonEnabled: true,
                              zoomControlsEnabled: true,
                              mapType: MapType.normal,
                              onMapCreated: (controller) {
                                _mapBloc.add(MapCreated(controller));
                              },
                              onCameraMove: (position) {
                                _mapBloc.add(CameraPositionChanged(position));
                              },
                            ),

                            // Animation progress example
                            if (state.selectedLocation != null)
                              Positioned(
                                top: 20,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: AnimationProgressTracker(
                                    duration: const Duration(milliseconds: 500),
                                    animationId: 'mapSelection',
                                    onComplete: () {
                                      debugPrint('Animation completed!');
                                    },
                                    child: const SizedBox.shrink(),
                                  ),
                                ),
                              ),

                            // Progress listener example
                            if (state.selectedLocation != null)
                              Positioned(
                                top: 50,
                                left: 20,
                                child: AnimationProgressListener(
                                  animationId: 'mapSelection',
                                  builder: (context, progress) {
                                    return Container(
                                      width: 200 * progress,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        borderRadius: BorderRadius.circular(2),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),

                      // Location details when selected
                      if (state.selectedLocation != null)
                        Expanded(
                          flex: 2, // Takes less space than map
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: Theme.of(context).dividerColor,
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                // Close button
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      _mapBloc.add(ClearSelection());
                                    },
                                  ),
                                ),

                                // Location details content
                                Expanded(
                                  child: SingleChildScrollView(
                                    padding: const EdgeInsets.all(16.0),
                                    child: LocationDetailsContent(
                                      location: state.selectedLocation!,
                                      isNew: true, // Just for demonstration
                                      onAddToTrip: () {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'Adding to trip will be implemented in a later step')),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                // Bottom locations list
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: state.locations.length,
                    itemBuilder: (context, index) {
                      final location = state.locations[index];
                      final isSelected =
                          state.selectedLocation?.id == location.id;

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        child: Card(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Colors.white,
                          child: ListTile(
                            leading: isSelected
                                ? PulsingWidget(
                                    pulseColor:
                                        _getColorForLocationType(location.type),
                                    child:
                                        _buildLocationTypeIcon(location.type),
                                  )
                                : _buildLocationTypeIcon(location.type),
                            title: Text(location.name),
                            subtitle:
                                Text(location.type.toString().split('.').last),
                            trailing: location.rating != null
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.star,
                                          color: Colors.amber),
                                      Text(location.rating!.toString()),
                                    ],
                                  )
                                : null,
                            onTap: () {
                              _mapBloc.add(SelectLocation(location));
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// Helper methods for location type icons
Widget _buildLocationTypeIcon(LocationType type) {
  return CircleAvatar(
    backgroundColor: _getColorForLocationType(type),
    child: Icon(
      _getIconForLocationType(type),
      color: Colors.white,
      size: 16,
    ),
  );
}

Color _getColorForLocationType(LocationType type) {
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

IconData _getIconForLocationType(LocationType type) {
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

class LocationsList extends StatelessWidget {
  final List<LocationModel> locations;
  final LocationModel? selectedLocation;
  final MapBloc bloc;

  const LocationsList({
    super.key,
    required this.bloc,
    required this.locations,
    this.selectedLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          color: Theme.of(context).colorScheme.primaryContainer,
          width: double.infinity,
          child: Text(
            'Nearby Locations (${locations.length})',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              final location = locations[index];
              final isSelected = selectedLocation?.id == location.id;

              return ListTile(
                title: Text(location.name),
                subtitle: Text(location.type.toString().split('.').last),
                trailing: location.rating != null
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.amber),
                          Text(location.rating!.toString()),
                        ],
                      )
                    : null,
                selected: isSelected,
                selectedTileColor: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.3),
                onTap: () {
                  bloc.add(SelectLocation(location));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
