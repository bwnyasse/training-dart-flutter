mkdir -p android/src/main/java/com/example/mybatterylevel && flutter pub run pigeon \
  --input pigeons/messages.dart \
  --dart_out lib/messages.dart \
  --java_out android/src/main/java/com/example/mybatterylevel/Messages.java \
  --java_package "com.example.mybatterylevel"