import 'package:flutter/material.dart';
import 'package:tuto_flutter_bloc/src/models/models.dart';
import 'package:tuto_flutter_bloc/src/services/impl/api_service.dart';
import 'package:tuto_flutter_bloc/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({@required this.title});

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
      body: LoadingWidget(
        message: "L'application est dans un état inconnu ...",
      ),
    );
  }
}

///
///  LOADED -----
///
class LoadedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApiService service = context.watch<ApiService>();
    return MoviesList(response: service.loadMockMovies());
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

  LoadingWidget({@required this.message});
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
