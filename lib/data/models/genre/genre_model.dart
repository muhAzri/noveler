import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_model.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class GenreModel extends Equatable{
  final String id;
  final String name;

  const GenreModel({required this.id, required this.name});
  
  @override
  List<Object> get props => [id,name];


  factory GenreModel.fromJson(Map<String, dynamic> json) => _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
