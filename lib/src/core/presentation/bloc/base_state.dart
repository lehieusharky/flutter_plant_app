import 'package:equatable/equatable.dart';
import 'package:plant_market/src/core/presentation/bloc/base_state_status.dart';

abstract class BaseState extends Equatable {
  final BaseStateStatus status;
  const BaseState({required this.status});

  @override
  List<Object> get props => [status];
}
