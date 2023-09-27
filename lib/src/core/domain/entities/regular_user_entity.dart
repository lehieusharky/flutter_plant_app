import 'package:equatable/equatable.dart';

class RegularUserEntity extends Equatable {
  final String userName;
  final String? email;

  const RegularUserEntity({
    required this.userName,
    this.email,
  });

  @override
  List<Object?> get props => [userName, email];
}
