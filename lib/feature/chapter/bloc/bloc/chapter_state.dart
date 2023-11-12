part of 'chapter_bloc.dart';

sealed class ChapterState extends Equatable {
  const ChapterState();

  @override
  List<Object> get props => [];
}

final class ChapterInitial extends ChapterState {}

final class ChapterLoading extends ChapterState {}

final class ChapterFailed extends ChapterState {
  final String error;

  const ChapterFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class ChapterListSucces extends ChapterState {
  final List<Chapter> chapters;

  const ChapterListSucces({required this.chapters});

  @override
  List<Object> get props => [chapters];
}

final class ChapterDetailSucces extends ChapterState {
  final ChapterDetail detail;

  const ChapterDetailSucces(this.detail);

  @override
  List<Object> get props => [detail];
}

final class ChapterHTMLSuccess extends ChapterState {
  final String html;

  const ChapterHTMLSuccess(this.html);

  @override
  List<Object> get props => [html];
}
