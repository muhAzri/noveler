import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/data/models/novel/novel_model.dart';
import 'package:noveler/data/services/bookmark_services.dart';

part 'bookmark_event.dart';
part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  final BookmarkServices services = GetIt.instance<BookmarkServices>();

  BookmarkBloc() : super(BookmarkInitial()) {
    on<AddOrRemoveBookmarkEvent>((event, emit) async {
      try {
        emit(BookmarkLoading());

        await services.addOrRemoveBookmark(event.novelID);

        if (event.inBookmark) {
          final novels = await services.getBookmarks();

          emit(GetBookmarkSuccess(novels));
        } else {
          emit(AddOrRemoveBookmarkSuccess());
        }
      } catch (e) {
        if (e is DioException) {
          emit(BookmarkFailed(e.response?.data['error']));
          return;
        }
        emit(BookmarkFailed(e.toString()));
      }
    });

    on<GetBookmarksEvent>((event, emit) async {
      try {
        emit(BookmarkLoading());

        final novels = await services.getBookmarks();

        emit(GetBookmarkSuccess(novels));
      } catch (e) {
        if (e is DioException) {
          emit(BookmarkFailed(e.response?.data['error']));
          return;
        }
        emit(BookmarkFailed(e.toString()));
      }
    });
  }
}
