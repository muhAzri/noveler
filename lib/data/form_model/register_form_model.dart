import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'register_form_model.g.dart';

@JsonSerializable(fieldRename:FieldRename.snake)
class RegisterFormModel extends Equatable {
  final String username;
  final String email;
  final String password;

  const RegisterFormModel({
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [username, email, password];

  factory RegisterFormModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterFormModelToJson(this);
}
