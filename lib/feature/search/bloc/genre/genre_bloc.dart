import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:noveler/data/models/genre/genre_model.dart';
import 'package:noveler/data/services/genre_services.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  GenreBloc() : super(GenreInitial()) {
    final GenreServices services = GetIt.instance<GenreServices>();

    on<GetGenresEvent>((event, emit) async {
      try {
        emit(GenreLoading());

        final genres = await services.getAllGenresServices();

        emit(GenreSuccess(genres));
      } catch (e) {
        if (e is DioException) {
          emit(GenreFailed(e.response?.data['error']));
          return;
        }
        emit(GenreFailed(e.toString()));
      }
    });
  }
}
