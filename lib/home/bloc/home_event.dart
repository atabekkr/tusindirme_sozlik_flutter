part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  // TODO: implement props
  @override
  List<Object?> get props => [];
}

class GetProductEvent extends HomeEvent {}
