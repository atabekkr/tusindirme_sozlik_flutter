part of 'word_bloc.dart';

@immutable
sealed class WordEvent {
  String? wordId;

  WordEvent({required this.wordId});
}

class GetWordEvent extends WordEvent {
  GetWordEvent({required super.wordId});
}

