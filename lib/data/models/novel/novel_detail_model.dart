import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:noveler/data/models/genre/genre_model.dart';

part 'novel_detail_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NovelDetailModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final int chaptersCount;
  final String coverImage;
  final String status;
  final String author;
  final double rating;
  final List<GenreModel> genres;
  final bool bookmarked;
  final DateTime createdAt;
  final DateTime updatedAt;

  const NovelDetailModel({
    required this.id,
    required this.title,
    required this.description,
    required this.chaptersCount,
    required this.coverImage,
    required this.status,
    required this.author,
    required this.rating,
    required this.genres,
    required this.bookmarked,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        chaptersCount,
        coverImage,
        status,
        author,
        rating,
        genres,
        bookmarked,
        createdAt,
        updatedAt,
      ];

  factory NovelDetailModel.fromJson(Map<String, dynamic> json) =>
      _$NovelDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$NovelDetailModelToJson(this);
}
