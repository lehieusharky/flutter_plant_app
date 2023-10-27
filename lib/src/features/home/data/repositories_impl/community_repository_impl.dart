import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/home/data/datasources/community_datasource.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/domain/repositories/community_repository.dart';

@Injectable(as: CommunityRepository)
class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityDataSource _communityDataSource;

  CommunityRepositoryImpl(this._communityDataSource);
  @override
  Future<Either<CommunityFailure, String?>> postCommunityPostImage(
      {required File imageFile}) async {
    try {
      final imageUrl = await _communityDataSource.postCommunityPostImage(
          imageFile: imageFile);
      return Right(imageUrl);
    } catch (e) {
      return Left(CommunityFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CommunityFailure, void>> createCommunityPost(
      {required CommunityPostModel communityPostModel}) async {
    try {
      final result = await _communityDataSource.createCommunityPost(
          communityPostModel: communityPostModel);
      return Right(result);
    } catch (e) {
      return Left(CommunityFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CommunityFailure, List<CommunityPostModel>>>
      getListCommunityPost({required int num}) async {
    try {
      final result = await _communityDataSource.getListCommunityPost(num: num);
      return Right(result);
    } catch (e) {
      return Left(CommunityFailure(message: e.toString()));
    }
  }
}
