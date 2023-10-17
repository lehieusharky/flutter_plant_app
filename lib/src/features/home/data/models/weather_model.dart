import 'package:json_annotation/json_annotation.dart';
import 'package:plant_market/src/features/home/domain/entities/weather_entity.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends WeatherEntity {
  WeatherModel({
    super.base,
    super.dt,
    super.main,
    super.weather,
    super.wind,
    super.name,
    super.visibility,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
