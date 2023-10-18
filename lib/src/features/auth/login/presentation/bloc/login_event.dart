part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginWithGoogle extends LoginEvent {}

final class LoginSentOtp extends LoginEvent {
  final SentOtpParams sentOtpParams;

  const LoginSentOtp({required this.sentOtpParams});
  @override
  List<Object> get props => [sentOtpParams];
}

final class LoginVerityOtp extends LoginEvent {
  final VerityOtpParams verityOtpParams;

  const LoginVerityOtp({required this.verityOtpParams});
  @override
  List<Object> get props => [verityOtpParams];
}

final class LoginGetUserInfomation extends LoginEvent {}

final class LoginSetNotLoggedIn extends LoginEvent {}
