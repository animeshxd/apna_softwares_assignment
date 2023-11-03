import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';

part 'list_products_event.dart';
part 'list_products_state.dart';

class ListProductsBloc extends Bloc<ListProductsEvent, ListProductsState> {
  final GetProducts getProducts;
  ListProductsBloc(GetProducts getProductsUseCase)
      : getProducts = getProductsUseCase,
        super(const ListProductsInitial()) {
    on<GetNextProducts>((event, emit) async {
      emit(NextListProductsLoading(state.currentPage, state.products));
      int nextPage = state.currentPage + 1;
      var result = await getProducts(GetProductsParams(page: nextPage));
      var nextState = result.fold(
        (f) => _failureToState(f, state),
        (r) => NextListProductsLoaded(nextPage, [...state.products, ...r]),
      );
      emit(nextState);
    });
  }
}

NextListProductsLoadFailed _failureToState(
  Failure failure,
  ListProductsState state,
) {
  String message = switch (failure) {
    UnhandledFailure() => 'Unhandled Error occures!!',
    ServerFailure() => 'Server returns Error!',
    ConnectionFailure() => 'Connection Failed!',
  };

  return NextListProductsLoadFailed(
    state.currentPage,
    state.products,
    message: message,
  );
}
