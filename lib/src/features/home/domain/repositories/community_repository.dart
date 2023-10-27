import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';

abstract class CommunityRepository {
  Future<Either<CommunityFailure, String?>> postCommunityPostImage(
      {required File imageFile});
  Future<Either<CommunityFailure, void>> createCommunityPost(
      {required CommunityPostModel communityPostModel});
}
