part of 'search_novel_bloc.dart';

sealed class SearchNovelState extends Equatable {
  const SearchNovelState();

  @override
  List<Object> get props => [];
}

final class SearchNovelInitial extends SearchNovelState {}

final class SearchNovelLoading extends SearchNovelState {}

final class SearchNovelFailed extends SearchNovelState {
  final String error;

  const SearchNovelFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class SearchNovelSuccess extends SearchNovelState {
  final List<NovelModel> novels;
  final bool hasMore;

  const SearchNovelSuccess(this.novels, this.hasMore);

  @override
  List<Object> get props => [novels];
}
