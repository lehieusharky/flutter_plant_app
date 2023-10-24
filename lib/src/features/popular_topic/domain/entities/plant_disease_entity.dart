import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plant_disease_entity.g.dart';

class PlantDiseaseEntity extends Equatable {
  final List<Data>? data;
  final int? total;

  const PlantDiseaseEntity({
    this.data,
    this.total,
  });

  @override
  List<Object?> get props => [data, total];
}

@JsonSerializable()
class Data {
  int? id;
  String? commonName;
  String? scientificName;
  List<String>? otherName;
  List<Description>? description;
  List<Solution>? solution;
  List<String>? host;
  List<Images>? images;

  Data({
    this.id,
    this.commonName,
    this.scientificName,
    this.otherName,
    this.description,
    this.solution,
    this.host,
    this.images,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Description {
  String? subtitle;
  String? description;

  Description({this.subtitle, this.description});

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}

@JsonSerializable()
class Solution {
  String? subtitle;
  String? description;

  Solution({this.subtitle, this.description});

  factory Solution.fromJson(Map<String, dynamic> json) =>
      _$SolutionFromJson(json);

  Map<String, dynamic> toJson() => _$SolutionToJson(this);
}

@JsonSerializable()
class Images {
  int? license;
  String? licenseName;
  String? originalUrl;
  String? regularUrl;

  Images({
    this.license,
    this.licenseName,
    this.originalUrl,
    this.regularUrl,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}
