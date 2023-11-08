import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_form_model.g.dart';

@JsonSerializable()
class SearchFormModel extends Equatable {
  final String? title;
  final String? status;
  final String? genres;
  final int? page;
  final int? pageSize;

  const SearchFormModel({
    this.title,
    this.status,
    this.genres,
    this.page,
    this.pageSize,
  });

  SearchFormModel copyWith({
    String? title,
    String? status,
    String? genres,
    int? page,
    int? pageSize,
  }) {
    return SearchFormModel(
      title: title ?? this.title,
      status: status ?? this.status,
      genres: genres ?? this.genres,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  SearchFormModel copyModel({
    SearchFormModel? model,
  }) {
    return SearchFormModel(
      title: model?.title ?? title,
      status: model?.status ?? status,
      genres: model?.genres ?? genres,
      page: model?.page ?? page,
      pageSize: model?.pageSize ?? pageSize,
    );
  }

  @override
  List<Object?> get props => [title, status, genres, page, pageSize];

  factory SearchFormModel.fromJson(Map<String, dynamic> json) =>
      _$SearchFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchFormModelToJson(this);
}
