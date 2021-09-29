import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuto_flutter_bloc/src/blocs/blocs.dart';
import 'package:tuto_flutter_bloc/src/widgets/widgets.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Drawer _buildDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                child: Image.network(
                  "https://i.ytimg.com/vi/oxeYeMHVLII/maxresdefault.jpg",
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Demo: Send LoadEvent'),
              onPressed: () {
                BlocProvider.of<AppBloc>(context).add(LoadEvent());
              },
            ),
            ElevatedButton(
              child: Text('Demo: Send ErrorEvent'),
              onPressed: () {
                BlocProvider.of<AppBloc>(context).add(ErrorEvent());
              },
            ),
            ElevatedButton(
              child: Text('Demo: Send LoadingEvent'),
              onPressed: () {
                BlocProvider.of<AppBloc>(context).add(LoadingEvent());
              },
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: _buildDrawer(),
      body: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        // Is Loading
        if (state is AppLoading) {
          return LoadingWidget(
            message: "Données en cours de chargement ...",
          );
        }

        // Is Loaded
        if (state is AppLoaded) {
          return LoadedWidget(list: state.response);
        }

        // State error
        if (state is AppError) {
          return ErrorWidget();
        }
        return LoadingWidget(
          message: "L'application est dans un état inconnu ...",
        );
      }),
    );
  }
}

///
///  LOADED -----
///
class LoadedWidget extends StatelessWidget {
  final list;

  LoadedWidget({@required this.list});

  @override
  Widget build(BuildContext context) {
    return MoviesList(response: list);
  }
}

///
///  ERROR -----
///
class ErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something went wrong!',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}

///
///  LOADING -----
///
class LoadingWidget extends StatelessWidget {
  final String message;

  LoadingWidget({required this.message});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text("$message"),
        ],
      ),
    );
  }
}
