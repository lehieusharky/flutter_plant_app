import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/features/home/data/datasources/community_datasource.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: CommunityDataSource)
class CommunityDataSourceImpl implements CommunityDataSource {
  @override
  Future<String?> postCommunityPostImage({required File imageFile}) async {
    try {
      final ext = imageFile.path.split('.').last;

      final imageRef = firebaseStorage.ref().child(
          'community_post/${sharePreference.getUserId()}/${const Uuid().v4()}.$ext');

      await imageRef.putFile(
          imageFile, SettableMetadata(contentType: 'image/$ext'));

      return await imageRef.getDownloadURL();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> createCommunityPost(
      {required CommunityPostModel communityPostModel}) async {
    try {
      final today = DateTime.now().toString();
      List<String> selectedTime = today.split(' ');
      await firebaseFirestore
          .collection(AppConstant.communityPostsCollection)
          .doc(selectedTime[0])
          .collection(AppConstant.postCollection)
          .doc(sharePreference.getUserId())
          .set(communityPostModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
