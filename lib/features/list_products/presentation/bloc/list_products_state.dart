part of 'list_products_bloc.dart';

abstract class ListProductsState extends Equatable {
  const ListProductsState(this.currentPage, this.products);
  final int currentPage;
  final List<Product> products;

  @override
  List<Object> get props => [];
}

class ListProductsInitial extends ListProductsState {
  const ListProductsInitial([super.currentPage = 0, super.products = const []]);
}

class NextListProductsLoading extends ListProductsState {
  const NextListProductsLoading(super.currentPage, super.products);
}

class NextListProductsLoaded extends ListProductsState {
  const NextListProductsLoaded(super.currentPage, super.products);
}

class NextListProductsLoadFailed extends ListProductsState {
  const NextListProductsLoadFailed(
    super.currentPage,
    super.products, {
    required this.message,
  });
  final String message;
}
