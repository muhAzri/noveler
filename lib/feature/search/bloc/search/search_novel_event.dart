part of 'search_novel_bloc.dart';

sealed class SearchNovelEvent extends Equatable {
  const SearchNovelEvent();

  @override
  List<Object> get props => [];
}

class SearchEvent extends SearchNovelEvent {
  final SearchFormModel params;

  const SearchEvent(this.params);

  @override
  List<Object> get props => [
        [params]
      ];
}

class GetMoreEvent extends SearchNovelEvent {
  final SearchFormModel params;

  const GetMoreEvent(this.params);

  @override
  List<Object> get props => [
        [params]
      ];
}
