import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class ForeCast {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  double visibility;
  Wind wind;
  Clouds clouds;
  double dt;
  Sys sys;
  int id;
  String name;
  double cod;

  ForeCast({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.id,
    this.name,
    this.cod,
  });

  factory ForeCast.fromJson(Map<String, dynamic> json) =>
      _$ForeCastFromJson(json);
  Map<String, dynamic> toJson() => _$ForeCastToJson(this);
}

@JsonSerializable()
class Coord {
  double lon;
  double lat;

  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
  Map<String, dynamic> toJson() => _$CoordToJson(this);
}

@JsonSerializable()
class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

@JsonSerializable()
class Main {
  double temp;
  double pressure;
  double humidity;
  @JsonKey(name: 'temp_min')
  double tempMin;
  @JsonKey(name: 'temp_max')
  double tempMax;

  Main({
    this.temp,
    this.pressure,
    this.humidity,
    this.tempMin,
    this.tempMax,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
  Map<String, dynamic> toJson() => _$MainToJson(this);

}

@JsonSerializable()
class Wind {
  double speed;
  double deg;

  Wind({
    this.speed,
    this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@JsonSerializable()
class Clouds {
  double all;

  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Sys {
  int type;
  int id;
  double message;
  String country;
  int sunrise;
  int sunset;

  Sys({
    this.type,
    this.id,
    this.message,
    this.country,
    this.sunrise,
    this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
  Map<String, dynamic> toJson() => _$SysToJson(this);
}
