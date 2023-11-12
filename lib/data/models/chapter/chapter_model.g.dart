// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      id: json['id'] as String,
      novelId: json['novel_id'] as String,
      title: json['title'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'novel_id': instance.novelId,
      'title': instance.title,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

ChapterDetail _$ChapterDetailFromJson(Map<String, dynamic> json) =>
    ChapterDetail(
      id: json['id'] as String,
      novelId: json['novel_id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      previousChapter: json['previous_chapter'] == null
          ? null
          : Chapter.fromJson(json['previous_chapter'] as Map<String, dynamic>),
      nextChapter: json['next_chapter'] == null
          ? null
          : Chapter.fromJson(json['next_chapter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChapterDetailToJson(ChapterDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'novel_id': instance.novelId,
      'title': instance.title,
      'content': instance.content,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'previous_chapter': instance.previousChapter,
      'next_chapter': instance.nextChapter,
    };
