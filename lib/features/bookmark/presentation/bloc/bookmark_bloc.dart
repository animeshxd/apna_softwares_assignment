import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/usecases.dart' as uc;

part 'bookmark_state.dart';
part 'bookmark_event.dart';

@lazySingleton
class BookmarkCubit extends Bloc<BookmarkEvent, BookmarkState> {
  final uc.GetFavoritesProducts _getFavoritesProducts;
  final uc.RemoveProductFromFavourites _removeProductFromFavourites;
  final uc.MarkProductAsFavorite _markProductAsFavorite;

  BookmarkCubit(
    this._getFavoritesProducts,
    this._removeProductFromFavourites,
    this._markProductAsFavorite,
  ) : super(const BookmarkInitial()) {
    on<GetFavouriteProducts>((event, emit) => _getFavouriteProducts(emit));
    on<RemoveProductFromFavourites>(
      (event, emit) => _removeFromFavourites(emit, event.productId),
    );
    on<AddProductToFavorites>(
      (event, emit) => _addProductToFavorites(emit, event.productId),
    );
  }

  void _getFavouriteProducts(emit) async {
    emit(BookmarksLoading(state.favourites));
    var result = await _getFavoritesProducts();

    var newState = result.fold(
      (l) => BookmarksLoadFailed(state.favourites),
      (r) => BookmarksLoaded(r),
    );
    emit(newState);
  }

  void _removeFromFavourites(emit, int productId) async {
    emit(BookmarksLoading(state.favourites));
    var result =
        await _removeProductFromFavourites(uc.Params(productId: productId));

    var newState = result.fold(
      (l) => BookmarksLoadFailed(state.favourites),
      (r) => BookmarksLoaded(r),
    );
    emit(newState);
  }

  void _addProductToFavorites(emit, int productId) async {
    emit(BookmarksLoading(state.favourites));
    var result = await _markProductAsFavorite(uc.Params(productId: productId));

    var newState = result.fold(
      (l) => BookmarksLoadFailed(state.favourites),
      (r) => BookmarksLoaded(r),
    );
    emit(newState);
  }
}
