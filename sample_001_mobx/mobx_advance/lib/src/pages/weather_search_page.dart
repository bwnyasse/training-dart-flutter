import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_advance/src/model/weather.dart';
import 'package:mobx_advance/src/stores/weather_store.dart';
import 'package:mobx_advance/src/widgets/city_input_field.dart';
import 'package:provider/provider.dart';

class WeatherSearchPage extends StatefulWidget {
  @override
  _WeatherSearchPageState createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  WeatherStore _weatherStore;
  List<ReactionDisposer> _disposers;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _weatherStore ??= context.read<WeatherStore>();
    _disposers ??= [
      reaction(
        (_) => _weatherStore.errorMessage,
        (String message) {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        },
      ),
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Recherche un climat"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        child: Observer(
          builder: (_) {
            switch (_weatherStore.state) {
              case StoreState.initial:
                return buildInitialInput();
              case StoreState.loading:
                return buildLoading();
              case StoreState.loaded:
                return buildColumnWithData(_weatherStore.weather);
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CitySearchInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(Weather weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          weather.cityName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          // Display the temperature with 1 decimal place
          "${weather.temperatureCelsius.toStringAsFixed(1)} °C",
          style: TextStyle(fontSize: 80),
        ),
        CitySearchInputField(),
      ],
    );
  }
}









