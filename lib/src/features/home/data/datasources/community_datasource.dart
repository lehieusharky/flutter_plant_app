import 'dart:io';

import 'package:plant_market/src/features/home/data/models/community_post_model.dart';

abstract class CommunityDataSource {
  Future<String?> postCommunityPostImage({required File imageFile});
  Future<void> createCommunityPost(
      {required CommunityPostModel communityPostModel});
  Future<List<CommunityPostModel>> getListCommunityPost({required int num});
}
