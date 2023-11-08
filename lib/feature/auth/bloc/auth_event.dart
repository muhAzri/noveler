part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final LoginFormModel model;

  const LoginEvent(this.model);

  @override
  List<Object> get props => [model];
}

class RegisterEvent extends AuthEvent {
  final RegisterFormModel model;

  const RegisterEvent(this.model);

  @override
  List<Object> get props => [model];
}
