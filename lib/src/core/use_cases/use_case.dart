import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class GetWeatherParams extends NoParams {
  final String lat;
  final String lon;

  GetWeatherParams({
    required this.lon,
    required this.lat,
  });

  @override
  List<Object> get props => [lat, lon];
}
