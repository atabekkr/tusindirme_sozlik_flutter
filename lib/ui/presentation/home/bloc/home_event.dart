part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class GetDailyWordEvent extends HomeEvent {}
class GetPopularWordsEvent extends HomeEvent {}
