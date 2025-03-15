#!/bin/bash
# create_structure.sh

# Create modules directory and subdirectories
mkdir -p lib/modules/home/pages
mkdir -p lib/modules/map/pages
mkdir -p lib/modules/profile/pages
mkdir -p lib/modules/trip/pages

# Create shared directory and subdirectories
mkdir -p lib/shared/components
mkdir -p lib/shared/models
mkdir -p lib/shared/utils

# Create empty module files
touch lib/modules/home/home_module.dart
touch lib/modules/map/map_module.dart
touch lib/modules/profile/profile_module.dart
touch lib/modules/trip/trip_module.dart

# Create empty page files
touch lib/modules/home/pages/home_page.dart
touch lib/modules/map/pages/map_page.dart
touch lib/modules/profile/pages/profile_page.dart
touch lib/modules/trip/pages/trip_page.dart

# Create shared files
touch lib/shared/components/app_button.dart
touch lib/shared/models/location_model.dart
touch lib/shared/utils/constants.dart

# Create app files
touch lib/app_module.dart
touch lib/app_widget.dart

# Backup the original main.dart
mv lib/main.dart lib/main.dart.bak

# Create new main.dart
touch lib/main.dart

echo "Project structure created successfully!"