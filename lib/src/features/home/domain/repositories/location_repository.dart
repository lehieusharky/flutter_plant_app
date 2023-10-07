import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:plant_market/src/features/auth/login/domain/use_cases/failure.dart';

abstract class LocationRepository {
  Future<Either<LocationFailure, Position>> determinePosition();
}
