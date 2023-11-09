import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/home/data/models/community_model.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';

abstract class CommunityRepository {
  Future<Either<CommunityFailure, String?>> postCommunityPostImage(
      {required File imageFile});
  Future<Either<CommunityFailure, void>> createCommunityPost(
      {required CommunityPostModel communityPostModel, required int number});

  Future<Either<CommunityFailure, List<CommunityPostModel>>>
      getListCommunityPost({required int num});

  Future<Either<CommunityFailure, CommunityModel>> getCommunityInformation();

  Future<Either<CommunityFailure, void>> addToFavoritePost(
      {required String communityPostId,
    required CommunityPostModel communityPostModel,});

  Future<Either<CommunityFailure, void>> removeFromFavoritePost(
      {required String communityPostId});

  Future<Either<CommunityFailure, List<CommunityPostModel>>>
      getListCommunitySearchResult({
    required int limit,
    String? keyWord,
    int? startAt,
  });
}
