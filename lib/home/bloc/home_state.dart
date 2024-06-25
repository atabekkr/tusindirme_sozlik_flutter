part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ProductLoadingState extends HomeState {}

class ProductLoadedState extends HomeState {
  const ProductLoadedState({required this.data});
  final Data data;
  @override
  List<Object> get props => [data];
}

class ProductEmptyState extends HomeState {}

class ProductLoadingFailedState extends HomeState {
  const ProductLoadingFailedState({required this.errorMessage});
  final String errorMessage;
}
