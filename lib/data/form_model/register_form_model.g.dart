// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterFormModel _$RegisterFormModelFromJson(Map<String, dynamic> json) =>
    RegisterFormModel(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterFormModelToJson(RegisterFormModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
    };
