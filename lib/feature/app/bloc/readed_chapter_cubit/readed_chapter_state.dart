part of 'readed_chapter_cubit.dart';

sealed class ReadedChapterState extends Equatable {
  const ReadedChapterState();

  @override
  List<Object> get props => [];
}

final class ReadedChapterInitial extends ReadedChapterState {}

final class ReadedChapterLoaded extends ReadedChapterState {
  final List<String> ids;

  const ReadedChapterLoaded(this.ids);

  @override
  List<Object> get props => [ids];
}
