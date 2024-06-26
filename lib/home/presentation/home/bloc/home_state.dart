part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class DailyWordCardLoadedState extends HomeState {

  const DailyWordCardLoadedState({required this.data});

  final Data data;
  @override
  List<Object> get props => [data];
}

class PopularWordsLoadedState extends HomeState {

  const PopularWordsLoadedState({required this.words});

  final List<Data> words;

  @override
  List<Object> get props => [words];
}

class HomeEmptyState extends HomeState {}

class HomeLoadingFailedState extends HomeState {

  const HomeLoadingFailedState({required this.errorMessage});

  final String errorMessage;
}
