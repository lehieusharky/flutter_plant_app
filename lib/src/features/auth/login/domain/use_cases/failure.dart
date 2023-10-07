import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginFailure extends Failure {
  final String message;

  LoginFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class LocationFailure extends Failure {
  final String message;

  LocationFailure({required this.message});
  @override
  List<Object> get props => [message];
}

// General failures
class ServerFailure extends Failure {
  final String message;

  ServerFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {}
