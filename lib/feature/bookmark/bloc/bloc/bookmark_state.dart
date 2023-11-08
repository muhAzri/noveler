part of 'bookmark_bloc.dart';

sealed class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

final class BookmarkInitial extends BookmarkState {}

final class BookmarkLoading extends BookmarkState {}

final class BookmarkFailed extends BookmarkState {
  final String erorr;

  const BookmarkFailed(this.erorr);

  @override
  List<Object> get props => [erorr];
}

final class GetBookmarkSuccess extends BookmarkState {
  final List<NovelModel> novels;

  const GetBookmarkSuccess(this.novels);

  @override
  List<Object> get props => [novels];
}

final class AddOrRemoveBookmarkSuccess extends BookmarkState {}
