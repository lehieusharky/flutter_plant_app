// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommunityPostModel _$CommunityPostModelFromJson(Map<String, dynamic> json) =>
    CommunityPostModel(
      title: json['title'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$CommunityPostModelToJson(CommunityPostModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'tags': instance.tags,
      'image': instance.image,
    };
