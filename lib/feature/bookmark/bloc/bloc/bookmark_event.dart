part of 'bookmark_bloc.dart';

sealed class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class AddOrRemoveBookmarkEvent extends BookmarkEvent {
  final String novelID;
  final bool inBookmark;

  const AddOrRemoveBookmarkEvent(this.novelID, {this.inBookmark = false});

  @override
  List<Object> get props => [novelID];
}

class GetBookmarksEvent extends BookmarkEvent {}
