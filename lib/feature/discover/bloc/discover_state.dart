part of 'discover_bloc.dart';

sealed class DiscoverState extends Equatable {
  const DiscoverState();

  @override
  List<Object> get props => [];
}

final class DiscoverInitial extends DiscoverState {}

final class DiscoverLoading extends DiscoverState {}

final class DiscoverFailed extends DiscoverState {
  final dynamic error;

  const DiscoverFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class DiscoverSuccess extends DiscoverState {
  final List<NovelModel> novels;

  const DiscoverSuccess(this.novels);

  @override
  List<Object> get props => [novels];
}
