import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chapter_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Chapter extends Equatable {
  final String id;
  final String novelId;
  final String title;
  final String createdAt;
  final String updatedAt;

  const Chapter({
    required this.id,
    required this.novelId,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, novelId, title, createdAt, updatedAt];

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ChapterDetail extends Equatable {
  final String id;
  final String novelId;
  final String title;
  final String content;
  final String createdAt;
  final String updatedAt;
  final Chapter? previousChapter;
  final Chapter? nextChapter;

  const ChapterDetail({
    required this.id,
    required this.novelId,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.previousChapter,
    this.nextChapter,
  });

  @override
  List<Object?> get props => [
        id,
        novelId,
        title,
        content,
        createdAt,
        updatedAt,
        previousChapter,
        nextChapter,
      ];

  factory ChapterDetail.fromJson(Map<String, dynamic> json) =>
      _$ChapterDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterDetailToJson(this);
}