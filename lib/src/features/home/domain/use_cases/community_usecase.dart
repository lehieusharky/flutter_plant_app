import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/home/data/models/community_model.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/domain/repositories/community_repository.dart';

CommunityUseCase get communityUseCase => injector.get<CommunityUseCase>();

abstract class CommunityUseCase {
  Future<String?> postCommunityPostImage({required File imageFile});

  Future<void> createCommunityPost(
      {required CommunityPostModel communityPostModel, required int number});

  Future<List<CommunityPostModel>> getListCommunityPost({required int num});

  Future<CommunityModel> getCommunityInformation();

  Future<void> addToFavoritePost({required String communityPostId});

  Future<void> removeFromFavoritePost({required String communityPostId});

  Future<List<CommunityPostModel>> getListCommunitySearchResult({
    required GetListCommunitySearchResultParam
        getListCommunitySearchResultParam,
  });
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
      {required CommunityPostModel communityPostModel,
      required int number}) async {
    try {
      final result = await _communityRepository.createCommunityPost(
          communityPostModel: communityPostModel, number: number);
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

  @override
  Future<CommunityModel> getCommunityInformation() async {
    try {
      final result = await _communityRepository.getCommunityInformation();
      return result.fold(
        (failure) {
          Logger().e('get community info failed: ${failure.message}');
          return const CommunityModel();
        },
        (communityModel) => communityModel,
      );
    } catch (e) {
      throw CommunityFailure(message: e.toString());
    }
  }

  @override
  Future<void> addToFavoritePost({required String communityPostId}) async {
    try {
      final result = await _communityRepository.addToFavoritePost(
          communityPostId: communityPostId);
      return result.fold(
        (failure) => Logger()
            .e('add favorite community post  failed: ${failure.message}'),
        (success) => Logger().e('add favorite community post  success: '),
      );
    } catch (e) {
      throw CommunityFailure(message: e.toString());
    }
  }

  @override
  Future<void> removeFromFavoritePost({required String communityPostId}) async {
    try {
      final result = await _communityRepository.removeFromFavoritePost(
          communityPostId: communityPostId);
      return result.fold(
        (failure) => Logger()
            .e('remove favorite community post  failed: ${failure.message}'),
        (success) => Logger().e('remove favorite community post  success: '),
      );
    } catch (e) {
      throw CommunityFailure(message: e.toString());
    }
  }

  @override
  Future<List<CommunityPostModel>> getListCommunitySearchResult({
    required GetListCommunitySearchResultParam
        getListCommunitySearchResultParam,
  }) async {
    try {
      final result = await _communityRepository.getListCommunitySearchResult(
        limit: getListCommunitySearchResultParam.limit,
        keyWord: getListCommunitySearchResultParam.keyWord,
        startAt: getListCommunitySearchResultParam.startAt,
      );
      return result.fold(
        (failure) {
          Logger().e('get list search community  failed: ${failure.message}');

          return [];
        },
        (listCommunityResult) => listCommunityResult,
      );
    } catch (e) {
      throw CommunityFailure(message: e.toString());
    }
  }
}
