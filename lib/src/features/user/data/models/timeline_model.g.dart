// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeLineModel _$TimeLineModelFromJson(Map<String, dynamic> json) =>
    TimeLineModel(
      description: json['description'] as String,
      image: json['image'] as String,
      createAt: json['createAt'] as String,
      userId: json['userId'] as String,
      timeLineId: json['timeLineId'] as String,
    );

Map<String, dynamic> _$TimeLineModelToJson(TimeLineModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'timeLineId': instance.timeLineId,
      'description': instance.description,
      'image': instance.image,
      'createAt': instance.createAt,
    };
