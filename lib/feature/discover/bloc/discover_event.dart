part of 'discover_bloc.dart';

sealed class DiscoverEvent extends Equatable {
  const DiscoverEvent();

  @override
  List<Object> get props => [];
}

class GetNewestNovelEvent extends DiscoverEvent {}

class GetNewlyUpdatedNovelEvent extends DiscoverEvent {}

class GetBestNovelEvent extends DiscoverEvent {}
