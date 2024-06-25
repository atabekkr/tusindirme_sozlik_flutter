import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tusindirme_sozlik_flutter/home/data/model/daily_word_model.dart';

import '../../helper/exception_handler.dart';
import '../data/repository/product_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final ProductRepository productRepository;

  HomeBloc({required this.productRepository}) : super(HomeInitial()) {
    on<GetProductEvent>(
            (GetProductEvent event, Emitter<HomeState> emit) async {
          emit(ProductLoadingState());
          try {
            final data = await productRepository.getProducts();
            if (data != null) {
              emit(ProductEmptyState());
            } else {
              emit(ProductLoadedState(data: data));
            }
          } catch (e) {
            print(e);
            final message = handleExceptionWithMessage(e);
            emit(ProductLoadingFailedState(errorMessage: message));
          }
        });
  }
}
