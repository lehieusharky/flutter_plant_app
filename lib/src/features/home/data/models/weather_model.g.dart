// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherModelAdapter extends TypeAdapter<WeatherModel> {
  @override
  final int typeId = 0;

  @override
  WeatherModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherModel(
      base: fields[1] as String?,
      dt: fields[5] as int?,
      main: fields[2] as Main?,
      weather: (fields[0] as List?)?.cast<Weather>(),
      wind: fields[4] as Wind?,
      name: fields[6] as String?,
      visibility: fields[3] as int?,
      dateTime: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.weather)
      ..writeByte(1)
      ..write(obj.base)
      ..writeByte(2)
      ..write(obj.main)
      ..writeByte(3)
      ..write(obj.visibility)
      ..writeByte(4)
      ..write(obj.wind)
      ..writeByte(5)
      ..write(obj.dt)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      base: json['base'] as String?,
      dt: json['dt'] as int?,
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
      name: json['name'] as String?,
      visibility: json['visibility'] as int?,
      dateTime: json['dateTime'] as String?,
    );
