part of 'all_words_bloc.dart';

@immutable
class AllWordsState {
  final List<Word> words;
  final EnumStatus status;
  final String message;

  AllWordsState(
      {this.words = const [],
      this.status = EnumStatus.initial,
      this.message = ""});

  AllWordsState copyWith(
      {List<Word>? words, EnumStatus? status, String? message}) {
    return AllWordsState(
        words: words ?? this.words,
        status: status ?? this.status,
        message: message ?? this.message);
  }
}

final class AllWordsInitial extends AllWordsState {}

enum EnumStatus { initial, loading, success, error }
