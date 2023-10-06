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

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}
