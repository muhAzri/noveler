part of 'detail_novel_bloc.dart';

sealed class DetailNovelEvent extends Equatable {
  const DetailNovelEvent();

  @override
  List<Object> get props => [];
}

class GetDetailNovelEvent extends DetailNovelEvent {
  final String novelID;

  const GetDetailNovelEvent({required this.novelID});

  @override
  List<Object> get props => [novelID];
}


class RefreshDetailNovelEvent extends DetailNovelEvent {
  final String novelID;

  const RefreshDetailNovelEvent({required this.novelID});

  @override
  List<Object> get props => [novelID];
}

class GetRecommendedNovelEvent extends DetailNovelEvent {}
