part of 'home_bloc.dart';

@immutable
class HomeState {
  final List<Word> words;
  final Word? dailyWord;
  final EnumStatus status;
  final String message;

  const HomeState({
    this.words = const [],
    this.dailyWord,
    this.status = EnumStatus.initial,
    this.message = "",
  });

  HomeState copyWith({
    List<Word>? words,
    EnumStatus? status,
    Word? dailyWord,
    String? message,
  }) {

    return HomeState(
      words: words ?? this.words,
      status: status ?? this.status,
      message: message ?? this.message,
      dailyWord: dailyWord ?? this.dailyWord,
    );
  }

}

enum EnumStatus { initial, loading, success, error }