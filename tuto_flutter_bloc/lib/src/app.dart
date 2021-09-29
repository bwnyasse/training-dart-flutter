import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuto_flutter_bloc/src/blocs/blocs.dart';
import 'package:tuto_flutter_bloc/src/services/services.dart';
import 'package:tuto_flutter_bloc/src/widgets/widgets.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Récuperation du service , grace à la mécanique InheritWidget de Provider
    ApiService apiService = context.watch<ApiService>();

    return MaterialApp(
      title: 'Tutorial Bloc',
      theme: ThemeData(primarySwatch: Colors.purple),
      // Fournit le bloc à tous les noeuds sous-adjacents
      home: BlocProvider(
        create: (context) => AppBloc(
          service: apiService,
        ),
        child: MyHomePage(title: 'Tutorial Formation - BLOC'),
      ),
    );
  }
}
