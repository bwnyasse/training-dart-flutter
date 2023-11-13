#!/bin/bash

# Prepare the output folder
mkdir -p android/src/main/java/com/example/mybatterylevel

# invocation
## This is the call to Pigeon that will ingest message.dart and generate the code for Android.
fvm flutter pub run pigeon \
  --input pigeons/app_device_helper.dart \
  --dart_out lib/app_device_helper.dart  \
  --java_package "com.example.mybatterylevel" \
  --java_out android/src/main/java/com/example/mybatterylevel/PigeonAppDeviceHelper.java