import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/domain/repositories/community_repository.dart';

CommunityUseCase get communityUseCase => injector.get<CommunityUseCase>();

abstract class CommunityUseCase {
  Future<String?> postCommunityPostImage({required File imageFile});
  Future<void> createCommunityPost(
      {required CommunityPostModel communityPostModel});
  Future<List<CommunityPostModel>> getListCommunityPost({required int num});
}

@Injectable(as: CommunityUseCase)
class CommunityUseCaseImpl extends UseCase<void, NoParams>
    implements CommunityUseCase {
  final CommunityRepository _communityRepository;

  CommunityUseCaseImpl(this._communityRepository);

  @override
  Future<void> call(NoParams params) {
    throw UnimplementedError();
  }

  @override
  Future<String?> postCommunityPostImage({required File imageFile}) async {
    try {
      final result = await _communityRepository.postCommunityPostImage(
          imageFile: imageFile);
      return result.fold(
        (failure) {
          Logger().e('Can not post community post image: ${failure.message}');
          return null;
        },
        (imageUrl) => imageUrl,
      );
    } catch (e) {
      throw CommunityFailure(message: e.toString());
    }
  }

  @override
  Future<void> createCommunityPost(
      {required CommunityPostModel communityPostModel}) async {
    try {
      final result = await _communityRepository.createCommunityPost(
          communityPostModel: communityPostModel);
      return result.fold(
        (failure) => Logger().e('Create post failed ${failure.message}'),
        (succcess) => Logger().d('Create post success'),
      );
    } catch (e) {
      throw CommunityFailure(message: e.toString());
    }
  }

  @override
  Future<List<CommunityPostModel>> getListCommunityPost(
      {required int num}) async {
    try {
      final result = await _communityRepository.getListCommunityPost(num: num);
      return result.fold(
        (failure) {
          Logger().e('get list post error: ${failure.message}');
          return [];
        },
        (listCommunityPost) => listCommunityPost,
      );
    } catch (e) {
      throw CommunityFailure(message: e.toString());
    }
  }
}