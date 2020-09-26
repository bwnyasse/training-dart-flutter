// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on _WeatherStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state => (_$stateComputed ??=
          Computed<StoreState>(() => super.state, name: '_WeatherStore.state'))
      .value;

  final _$_weatherFutureAtom = Atom(name: '_WeatherStore._weatherFuture');

  @override
  ObservableFuture<Weather> get _weatherFuture {
    _$_weatherFutureAtom.reportRead();
    return super._weatherFuture;
  }

  @override
  set _weatherFuture(ObservableFuture<Weather> value) {
    _$_weatherFutureAtom.reportWrite(value, super._weatherFuture, () {
      super._weatherFuture = value;
    });
  }

  final _$weatherAtom = Atom(name: '_WeatherStore.weather');

  @override
  Weather get weather {
    _$weatherAtom.reportRead();
    return super.weather;
  }

  @override
  set weather(Weather value) {
    _$weatherAtom.reportWrite(value, super.weather, () {
      super.weather = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_WeatherStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$getWeatherAsyncAction = AsyncAction('_WeatherStore.getWeather');

  @override
  Future<dynamic> getWeather(String cityName) {
    return _$getWeatherAsyncAction.run(() => super.getWeather(cityName));
  }

  @override
  String toString() {
    return '''
weather: ${weather},
errorMessage: ${errorMessage},
state: ${state}
    ''';
  }
}
