import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/model/daily_word_model.dart';
import '../../../../helper/exception_handler.dart';
import '../repository/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(const HomeState()) {
    on<HomeEvent>((HomeEvent event, Emitter<HomeState> emit) async {
      if (event is GetDailyWordEvent) {
        emit(state.copyWith(status: EnumStatus.loading));
        try {
          final dailyWord = await homeRepository.getDailyWord();
          emit(
              state.copyWith(status: EnumStatus.success, dailyWord: dailyWord));
        } catch (e) {
          final message = handleExceptionWithMessage(e);
          emit(state.copyWith(status: EnumStatus.error, message: message));
        }
      }
      if (event is GetPopularWordsEvent) {
        try {
          final words = await homeRepository.getPopularWords();
          emit(state.copyWith(status: EnumStatus.success, words: words));
        } catch (e) {
          final message = handleExceptionWithMessage(e);
          emit(state.copyWith(status: EnumStatus.error, message: message));
        }
      }
    });
  }
}
