// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NovelDetailModel _$NovelDetailModelFromJson(Map<String, dynamic> json) =>
    NovelDetailModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      chaptersCount: json['chapters_count'] as int,
      coverImage: json['cover_image'] as String,
      status: json['status'] as String,
      author: json['author'] as String,
      rating: (json['rating'] as num).toDouble(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookmarked: json['bookmarked'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$NovelDetailModelToJson(NovelDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'chapters_count': instance.chaptersCount,
      'cover_image': instance.coverImage,
      'status': instance.status,
      'author': instance.author,
      'rating': instance.rating,
      'genres': instance.genres,
      'bookmarked': instance.bookmarked,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
