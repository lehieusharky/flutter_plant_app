import 'package:equatable/equatable.dart';
import 'package:plant_market/src/features/user/data/models/timeline_model.dart';

class PlantEntity extends Equatable {
  final String id;
  final String name;
  final List<TimeLineModel> listTimeLine;

  const PlantEntity({
    required this.id,
    required this.name,
    required this.listTimeLine,
  });

  @override
  List<Object?> get props => [id, name, listTimeLine];
}
