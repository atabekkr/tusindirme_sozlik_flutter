import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/daily_word_model.dart';
import '../repository/all_words_repository.dart';

part 'all_words_event.dart';

part 'all_words_state.dart';

class AllWordsBloc extends Bloc<AllWordsEvent, AllWordsState> {
  final AllWordsRepository repository = AllWordsRepository();

  AllWordsBloc() : super(AllWordsInitial()) {
    on<AllWordsEvent>((event, emit) async {
      if (event is GetNewWordsEvent) {
        emit(state.copyWith(status: EnumStatus.loading));
        try {
          final words = <Word>[];
          words.addAll(state.words);
          words.addAll(await repository.getNewWords(event.pageIndex!));
          emit(state.copyWith(words: words, status: EnumStatus.success));
        } catch (e) {
          print(e);
          emit(state.copyWith(status: EnumStatus.error, message: "$e"));
        }
      }
    });
  }
}
