import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tusindirme_sozlik_flutter/home/presentation/word/repository/word_repository.dart';

import '../../../../data/model/daily_word_model.dart';
import '../../../../helper/exception_handler.dart';

part 'word_event.dart';
part 'word_state.dart';

class WordBloc extends Bloc<WordEvent, WordState> {
  final WordRepository repository = WordRepository();

  WordBloc() : super(WordInitial()) {
    on<GetWordEvent>((event, emit) async {
      emit(WordLoadingState());
      try {
        final word = await repository.getWordById(event.wordId!);
        emit(WordLoadedState(word: word));
      } catch (e) {
        final message = handleExceptionWithMessage(e);
        emit(WordLoadingFailedState(errorMessage: message));
      }
    });
  }
}
