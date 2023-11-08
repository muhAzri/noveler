import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'novel_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NovelModel extends Equatable {
  final String id;
  final String title;
  final String coverImage;
  final double? rating;
  final DateTime createdAt;
  final DateTime updatedAt;

  const NovelModel({
    required this.id,
    required this.title,
    required this.coverImage,
    this.rating,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [id, title, coverImage, createdAt, updatedAt];

  factory NovelModel.fromJson(Map<String, dynamic> json) =>
      _$NovelModelFromJson(json);

  Map<String, dynamic> toJson() => _$NovelModelToJson(this);
}
