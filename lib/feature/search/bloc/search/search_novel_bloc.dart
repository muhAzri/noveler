import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/data/form_model/search_form_model.dart';
import 'package:noveler/data/models/novel/novel_model.dart';
import 'package:noveler/data/services/search_novel.services.dart';

part 'search_novel_event.dart';
part 'search_novel_state.dart';

class SearchNovelBloc extends Bloc<SearchNovelEvent, SearchNovelState> {
  final SearchNovelServices services = GetIt.instance<SearchNovelServices>();

  List<NovelModel> gettedNovels = [];

  SearchNovelBloc() : super(SearchNovelInitial()) {
    on<SearchEvent>((event, emit) async {
      try {
        emit(SearchNovelLoading());

        gettedNovels.clear();

        final novels = await services.searchNovel(event.params);

        gettedNovels.addAll(novels);
        emit(SearchNovelSuccess(
            gettedNovels, novels.isNotEmpty && novels.length == 12));
      } catch (e) {
        if (e is DioException) {
          emit(SearchNovelFailed(e.response?.data['error']));
          return;
        }
        emit(SearchNovelFailed(e.toString()));
      }
    });

    on<GetMoreEvent>(
      (event, emit) async {
        try {
          final novels = await services.searchNovel(event.params);

          gettedNovels.addAll(novels);
          emit(SearchNovelSuccess(gettedNovels, novels.isNotEmpty));
        } catch (e) {
          if (e is DioException) {
            emit(SearchNovelFailed(e.response?.data['error']));
            return;
          }
          emit(SearchNovelFailed(e.toString()));
        }
      },
      transformer: sequential(),
    );
  }
}
