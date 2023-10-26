part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginSentOtpSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  final String message;

  const LoginFailure({required this.message});
  @override
  List<Object> get props => [message];
}
final class LoginWithGoogleFailure extends LoginFailure {
  const LoginWithGoogleFailure({required super.message});
}

final class LoginSentOtpFailure extends LoginFailure {
  const LoginSentOtpFailure({required super.message});
}

final class LoginVerifyOtpFailure extends LoginFailure {
  const LoginVerifyOtpFailure({required super.message});
}

final class LoginLoading extends LoginState {}
