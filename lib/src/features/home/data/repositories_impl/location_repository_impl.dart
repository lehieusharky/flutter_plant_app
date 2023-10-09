import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/home/data/datasources/location_datasource.dart';
import 'package:plant_market/src/features/home/domain/repositories/location_repository.dart';

@Singleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final LocationDataSource _locationDataSource;

  LocationRepositoryImpl(this._locationDataSource);
  @override
  Future<Either<LocationFailure, Position>> determinePosition() async {
    try {
      final position = await _locationDataSource.determinePosition();
      return Right(position);
    } catch (e) {
      return Left(LocationFailure(message: e.toString()));
    }
  }
}
