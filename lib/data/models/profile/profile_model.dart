import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileModel extends Equatable {
  final String id;
  final String username;
  final String email;

  const ProfileModel({
    required this.id,
    required this.username,
    required this.email,
  });

  @override
  List<Object> get props => [id, username, email];

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
