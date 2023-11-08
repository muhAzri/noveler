import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_form_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginFormModel extends Equatable {
  final String email;
  final String password;

  const LoginFormModel({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];

  factory LoginFormModel.fromJson(Map<String, dynamic> json) =>
      _$LoginFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginFormModelToJson(this);
}
