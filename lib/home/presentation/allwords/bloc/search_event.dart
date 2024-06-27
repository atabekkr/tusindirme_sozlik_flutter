part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {
  String? searchText;

  SearchEvent({required this.searchText});
}

class GetSearchResultEvent extends SearchEvent {
  GetSearchResultEvent({required super.searchText});
}
