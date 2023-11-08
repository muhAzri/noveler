// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_form_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFormModel _$SearchFormModelFromJson(Map<String, dynamic> json) =>
    SearchFormModel(
      title: json['title'] as String?,
      status: json['status'] as String?,
      genres: json['genres'] as String?,
      page: json['page'] as int?,
      pageSize: json['pageSize'] as int?,
    );

Map<String, dynamic> _$SearchFormModelToJson(SearchFormModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'status': instance.status,
      'genres': instance.genres,
      'page': instance.page,
      'pageSize': instance.pageSize,
    };
