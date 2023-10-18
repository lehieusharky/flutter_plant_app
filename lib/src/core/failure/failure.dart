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

class LogOutFailure extends Failure {
  final String message;

  LogOutFailure({required this.message});
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

class PhoneFailure extends Failure {
  final String message;

  PhoneFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class SystemFailure extends Failure {
  final String message;

  SystemFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class UserFailure extends Failure {
  final String message;

  UserFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class ImagePickerFailure extends Failure {
  final String message;

  ImagePickerFailure({required this.message});
  @override
  List<Object> get props => [message];
}

class AuthDataBaseFailure extends Failure {
  final String message;

  AuthDataBaseFailure({required this.message});
  @override
  List<Object> get props => [message];
}
