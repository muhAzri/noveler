part of 'genre_bloc.dart';

sealed class GenreState extends Equatable {
  const GenreState();

  @override
  List<Object> get props => [];
}

final class GenreInitial extends GenreState {}

final class GenreLoading extends GenreState {}

final class GenreFailed extends GenreState {
  final String error;

  const GenreFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class GenreSuccess extends GenreState {
  final List<GenreModel> genres;

  const GenreSuccess(this.genres);
  @override
  List<Object> get props => [genres];
}
