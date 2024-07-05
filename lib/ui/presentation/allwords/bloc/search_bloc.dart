import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/daily_word_model.dart';
import '../../../../helper/exception_handler.dart';
import '../repository/all_words_repository.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final AllWordsRepository repository = AllWordsRepository();

  SearchBloc() : super(SearchInitial()) {
    on<SearchEvent>((event, emit) async {
      try {
        final words = await repository.getSearchResult(event.searchText!);
        emit(SearchResultLoadedResult(words: words));
      } catch (e) {
        final message = handleExceptionWithMessage(e);
      }
    });
  }
}
