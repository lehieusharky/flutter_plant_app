import 'package:json_annotation/json_annotation.dart';
part 'weather_entity.g.dart';

class WeatherEntity {
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  int? dt;
  String? name;

  WeatherEntity({
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.dt,
    this.name,
  });
}

@JsonSerializable(includeIfNull: false)
class Weather {
  String? main;
  String? description;

  Weather({
    this.main,
    this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@JsonSerializable(includeIfNull: false)
class Main {
  double? temp;
  double? tempMin;
  double? tempMax;
  int? pressure;
  int? humidity;

  Main({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@JsonSerializable(includeIfNull: false)
class Wind {
  double? speed;

  Wind({this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
