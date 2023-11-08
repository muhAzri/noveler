import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/data/models/novel/novel_model.dart';
import 'package:noveler/data/services/discover_services.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final DiscoverServices services = GetIt.instance<DiscoverServices>();

  DiscoverBloc() : super(DiscoverInitial()) {
    on<GetNewestNovelEvent>((event, emit) async {
      try {
        emit(DiscoverLoading());

        final novels = await services.getNewestNovel();

        emit(DiscoverSuccess(novels));
      } catch (e) {
        if (e is DioException) {
          emit(DiscoverFailed(e.response?.data['error']));
          return;
        }
        emit(const DiscoverFailed("Unexpected error"));
      }
    });

    on<GetNewlyUpdatedNovelEvent>((event, emit) async {
      try {
        emit(DiscoverLoading());

        final novels = await services.getNewUpdatedNovel();

        emit(DiscoverSuccess(novels));
      } catch (e) {
        if (e is DioException) {
          emit(DiscoverFailed(e.response?.data['error']));
          return;
        }
        emit(const DiscoverFailed("Unexpected error"));
      }
    });

    on<GetBestNovelEvent>((event, emit) async {
      try {
        emit(DiscoverLoading());

        final novels = await services.getBestNovel();

        emit(DiscoverSuccess(novels));
      } catch (e) {
        if (e is DioException) {
          emit(DiscoverFailed(e.response?.data['error']));
          return;
        }
        emit(const DiscoverFailed("Unexpected error"));
      }
    });
  }
}
