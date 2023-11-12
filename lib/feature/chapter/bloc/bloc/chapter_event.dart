part of 'chapter_bloc.dart';

sealed class ChapterEvent extends Equatable {
  const ChapterEvent();

  @override
  List<Object> get props => [];
}

class GetChapterListEvent extends ChapterEvent {
  final String novelID;

  const GetChapterListEvent({required this.novelID});

  @override
  List<Object> get props => [novelID];
}

class GetChapterDetailEvent extends ChapterEvent {
  final String chapterID;

  const GetChapterDetailEvent({required this.chapterID});

  @override
  List<Object> get props => [chapterID];
}

class GetChapterHTMLEvent extends ChapterEvent {
  final String htmlURL;

  const GetChapterHTMLEvent(this.htmlURL);
  @override
  List<Object> get props => [htmlURL];
}
