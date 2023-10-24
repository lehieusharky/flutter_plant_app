import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather_entity.g.dart';

class WeatherEntity extends HiveObject {
  @HiveField(0)
  List<Weather>? weather;
  @HiveField(1)
  String? base;
  @HiveField(2)
  Main? main;
  @HiveField(3)
  int? visibility;
  @HiveField(4)
  Wind? wind;
  @HiveField(5)
  int? dt;
  @HiveField(6)
  String? name;
  @HiveField(7)
  String? dateTime;

  WeatherEntity({
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.dt,
    this.name,
    this.dateTime,
  });

  void setDateTime(String dateTimeNow) => dateTime = dateTimeNow;
}

@HiveType(typeId: 1)
@JsonSerializable(includeIfNull: false, createToJson: false)
class Weather {
  @HiveField(0)
  String? main;
  @HiveField(1)
  String? description;

  Weather({
    this.main,
    this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@HiveType(typeId: 2)
@JsonSerializable(includeIfNull: false, createToJson: false)
class Main {
  @HiveField(0)
  double? temp;
  @HiveField(1)
  double? tempMin;
  @HiveField(2)
  double? tempMax;
  @HiveField(3)
  int? pressure;
  @HiveField(4)
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

@HiveType(typeId: 3)
@JsonSerializable(includeIfNull: false, createToJson: false)
class Wind {
  @HiveField(0)
  double? speed;

  Wind({this.speed});

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
