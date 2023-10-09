import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:plant_market/src/core/failure/failure.dart';

abstract class LocationRepository {
  Future<Either<LocationFailure, Position>> determinePosition();
}
