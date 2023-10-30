import 'package:equatable/equatable.dart';

class CommunityEntity extends Equatable {
  final int? number;

  const CommunityEntity({this.number});

  @override
  List<Object?> get props => [number];
}
