import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/data/models/novel/novel_detail_model.dart';
import 'package:noveler/data/models/novel/novel_model.dart';
import 'package:noveler/data/services/novel_detail_services.dart';

part 'detail_novel_event.dart';
part 'detail_novel_state.dart';

class DetailNovelBloc extends Bloc<DetailNovelEvent, DetailNovelState> {
  final NovelDetailServices services = GetIt.instance<NovelDetailServices>();

  DetailNovelBloc() : super(DetailNovelInitial()) {
    on<GetDetailNovelEvent>((event, emit) async {
      emit(DetailNovelLoading());

      try {
        final detail = await services.getModelDetail(event.novelID);

        emit(DetailNovelSuccess(detail: detail));
      } catch (e) {
        if (e is DioException) {
          emit(DetailNovelFailed(error: e.response?.data['error']));
          return;
        }
        emit(DetailNovelFailed(error: e.toString()));
      }
    });

    on<RefreshDetailNovelEvent>((event, emit) async {
      try {
        final detail = await services.getModelDetail(event.novelID);

        emit(DetailNovelSuccess(detail: detail));
      } catch (e) {
        if (e is DioException) {
          emit(DetailNovelFailed(error: e.response?.data['error']));
          return;
        }
        emit(DetailNovelFailed(error: e.toString()));
      }
    });

    on<GetRecommendedNovelEvent>((event, emit) async {
      try {
        emit(DetailNovelLoading());

        final recommendedNovels = await services.getRecommendedNovel();

        emit(RecommendedNovelSuccess(recommendedNovels: recommendedNovels));
      } catch (e) {
        if (e is DioException) {
          emit(DetailNovelFailed(error: e.response?.data['error']));
          return;
        }
        emit(DetailNovelFailed(error: e.toString()));
      }
    });
  }
}
