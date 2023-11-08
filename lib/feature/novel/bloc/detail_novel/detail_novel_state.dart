part of 'detail_novel_bloc.dart';

sealed class DetailNovelState extends Equatable {
  const DetailNovelState();

  @override
  List<Object> get props => [];
}

final class DetailNovelInitial extends DetailNovelState {}

final class DetailNovelLoading extends DetailNovelState {}

final class DetailNovelFailed extends DetailNovelState {
  final String error;

  const DetailNovelFailed({required this.error});

  @override
  List<Object> get props => [error];
}

final class DetailNovelSuccess extends DetailNovelState {
  final NovelDetailModel detail;

  const DetailNovelSuccess({required this.detail});

  @override
  List<Object> get props => [detail];
}

final class RecommendedNovelSuccess extends DetailNovelState {
  final List<NovelModel> recommendedNovels;

  const RecommendedNovelSuccess({required this.recommendedNovels});

  @override
  List<Object> get props => [recommendedNovels];
}
