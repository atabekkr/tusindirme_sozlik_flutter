part of 'all_words_bloc.dart';

@immutable
sealed class AllWordsEvent {
  int? pageIndex;
  AllWordsEvent({required this.pageIndex});
}

class GetNewWordsEvent extends AllWordsEvent {
  GetNewWordsEvent({required super.pageIndex});
}
