part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFailed extends AuthState {
  final String error;

  const AuthFailed({required this.error});

  @override
  List<Object> get props => [error];
}

final class AuthSuccess extends AuthState {
  final Response response;

  const AuthSuccess({required this.response});

  @override
  List<Object> get props => [response];
}
