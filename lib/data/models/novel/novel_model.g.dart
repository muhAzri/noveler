// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NovelModel _$NovelModelFromJson(Map<String, dynamic> json) => NovelModel(
      id: json['id'] as String,
      title: json['title'] as String,
      coverImage: json['cover_image'] as String,
      rating: (json['rating'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$NovelModelToJson(NovelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover_image': instance.coverImage,
      'rating': instance.rating,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
