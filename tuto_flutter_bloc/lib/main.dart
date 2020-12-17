import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:tuto_flutter_bloc/src/app.dart';
import 'package:tuto_flutter_bloc/src/providers/providers.dart';

void main() => runApp(AppProvider(
      httpClient: Client(),
      child: MyApp(),
    ));
