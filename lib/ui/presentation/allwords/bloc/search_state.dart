part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchResultLoadedResult extends SearchState {
  SearchResultLoadedResult({required this.words});

  final List<Word> words;
}
