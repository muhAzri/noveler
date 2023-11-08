part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileFailed extends ProfileState {
  final dynamic error;

  const ProfileFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class ProfileSuccess extends ProfileState {
  final ProfileModel model;

  const ProfileSuccess(this.model);

  @override
  List<Object> get props => [model];
}
