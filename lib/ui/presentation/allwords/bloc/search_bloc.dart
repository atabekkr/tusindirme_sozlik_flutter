import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../data/model/daily_word_model.dart';
import '../../../../helper/exception_handler.dart';
import '../../word/repository/word_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final WordRepository repository = WordRepository();

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
