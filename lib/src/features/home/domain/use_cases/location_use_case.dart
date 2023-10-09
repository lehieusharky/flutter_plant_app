import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/home/domain/repositories/location_repository.dart';

LocationUseCase get locationUseCase => injector.get<LocationUseCase>();

abstract class LocationUseCase {
  Future<Position?> call(NoParams params);
}

@Singleton(as: LocationUseCase)
class LocationUseCaseImpl extends UseCase<Position?, NoParams>
    implements LocationUseCase {
  final LocationRepository _locationRepository;

  LocationUseCaseImpl(this._locationRepository);
  @override
  Future<Position?> call(NoParams params) async {
    try {
      final result = await _locationRepository.determinePosition();
      return result.fold(
        (failure) {
          throw LocationFailure(message: failure.message);
        },
        (position) => position,
      );
    } catch (e) {
      throw LocationFailure(message: e.toString());
    }
  }
}
