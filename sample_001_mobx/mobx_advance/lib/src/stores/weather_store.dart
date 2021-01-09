
import 'package:mobx/mobx.dart';
import 'package:mobx_advance/src/api/weather_api.dart';
import 'package:mobx_advance/src/model/weather.dart';

part 'weather_store.g.dart';


enum StoreState { initial, loading, loaded }

// Stores
// -------

class WeatherStore extends _WeatherStore with _$WeatherStore {
  WeatherStore(FakeWeatherAPI api) : super(api);
}

abstract class _WeatherStore with Store {
  final FakeWeatherAPI _api;

  _WeatherStore(this._api);

  @observable
  ObservableFuture<Weather> _weatherFuture;
  
  @observable
  Weather weather;

  @observable
  String errorMessage;

  @computed
  StoreState get state {
    if (_weatherFuture == null ||
        _weatherFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _weatherFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future getWeather(String cityName) async {
    try {
      errorMessage = null;
      _weatherFuture =
          ObservableFuture(_api.fetchWeather(cityName));
      weather = await _weatherFuture;
    } on NetworkError {
      errorMessage = "Couldn't fetch weather. Is the device online?";
    }
  }
}