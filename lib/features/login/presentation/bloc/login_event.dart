part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {}

class PostLoginEvent extends LoginEvent {
  PostLoginEvent({required this.niy, required this.password});

  final String niy, password;

  @override
  List<Object?> get props => [niy, password];
}
