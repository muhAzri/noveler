import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/data/models/chapter/chapter_model.dart';
import 'package:noveler/data/services/chapter_service.dart';

part 'chapter_event.dart';
part 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  final ChapterService services = GetIt.instance<ChapterService>();

  ChapterBloc() : super(ChapterInitial()) {
    on<GetChapterListEvent>((event, emit) async {
      try {
        emit(ChapterLoading());

        final chapters = await services.getChaptersList(event.novelID);

        emit(ChapterListSucces(chapters: chapters));
      } catch (e) {
        if (e is DioException) {
          emit(ChapterFailed(e.response?.data['error'] ?? e.toString()));
          return;
        }
        emit(ChapterFailed(e.toString()));
      }
    });

    on<GetChapterDetailEvent>((event, emit) async {
      try {
        emit(ChapterLoading());

        final detail = await services.getChapterDetail(event.chapterID);

        emit(ChapterDetailSucces(detail));
      } catch (e) {
        if (e is DioException) {
          emit(ChapterFailed(e.response?.data['error'] ?? e.toString()));
          return;
        }
        emit(ChapterFailed(e.toString()));
      }
    });

    on<GetChapterHTMLEvent>((event, emit) async {
      try {
        emit(ChapterLoading());

        final html = await services.getChapterHTML(event.htmlURL);

        emit(ChapterHTMLSuccess(html));
      } catch (e) {
        emit(ChapterFailed(e.toString()));
      }
    });
  }
}
