import 'package:plant_market/src/core/use_cases/use_case.dart';

abstract class CommunityUseCase {}

class CommunityUseCaseImpl extends UseCase<void, NoParams> {
  @override
  Future<void> call(NoParams params) {
    throw UnimplementedError();
  }
}
