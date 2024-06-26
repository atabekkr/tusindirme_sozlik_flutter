import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/model/daily_word_model.dart';
import '../../../../helper/exception_handler.dart';
import '../repository/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(HomeInitial()) {
    on<HomeEvent>((HomeEvent event, Emitter<HomeState> emit) async {
      if (event is GetDailyWordEvent) {
        try {
          final data = await homeRepository.getDailyWord();
          emit(DailyWordCardLoadedState(data: data));
        } catch (e) {
          final message = handleExceptionWithMessage(e);
          emit(HomeLoadingFailedState(errorMessage: message));
        }
      }
      if (event is GetPopularWordsEvent) {
        try {
          final words = await homeRepository.getPopularWords();
          emit(PopularWordsLoadedState(words: words));
        } catch (e) {
          final message = handleExceptionWithMessage(e);
          emit(HomeLoadingFailedState(errorMessage: message));
        }
      }
    });

    // on<GetPopularWordsEvent>(
    //     (GetPopularWordsEvent event, Emitter<HomeState> emit) async {
    //   try {
    //     final words = await homeRepository.getPopularWords();
    //     emit(DailyWordCardLoadedState(words: words));
    //   } catch (e) {
    //     final message = handleExceptionWithMessage(e);
    //     emit(HomeLoadingFailedState(errorMessage: message));
    //   }
    // });
  }
}
