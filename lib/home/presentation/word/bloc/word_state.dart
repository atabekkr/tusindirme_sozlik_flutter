part of 'word_bloc.dart';

@immutable
sealed class WordState {}

final class WordInitial extends WordState {}

class WordLoadingState extends WordState {}

class WordLoadedState extends WordState {
  WordLoadedState({required this.word});

  final Word word;
}

class WordLoadingFailedState extends WordState {
  WordLoadingFailedState({required this.errorMessage});

  final String errorMessage;
}
