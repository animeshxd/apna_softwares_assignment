import 'package:apna_softwares_assignment/features/bookmark/domain/usecases/get_favorites_products.dart';
import 'package:apna_softwares_assignment/features/bookmark/domain/usecases/mark_as_favorite.dart';
import 'package:apna_softwares_assignment/features/bookmark/domain/usecases/params.dart';
import 'package:apna_softwares_assignment/features/bookmark/domain/usecases/remove_from_favourites.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  final GetFavoritesProducts _getFavoritesProducts;
  final RemoveFromFavourites _removeFromFavourites;
  final MarkProductAsFavorite _markProductAsFavorite;

  BookmarkCubit(
    this._getFavoritesProducts,
    this._removeFromFavourites,
    this._markProductAsFavorite,
  ) : super(const BookmarkInitial());

  void getFavouriteProducts() async {
    emit(BookmarksLoading(state.favourites));
    var result = await _getFavoritesProducts();

    var newState = result.fold(
      (l) => BookmarksLoadFailed(state.favourites),
      (r) => BookmarksLoaded(r),
    );
    emit(newState);
  }

  void removeFromFavourites(int productId) async {
    emit(BookmarksLoading(state.favourites));
    var result = await _removeFromFavourites(Params(productId: productId));

    var newState = result.fold(
      (l) => BookmarksLoadFailed(state.favourites),
      (r) => BookmarksLoaded(r),
    );
    emit(newState);
  }

  void markProductAsFavorite(int productId) async {
    emit(BookmarksLoading(state.favourites));
    var result = await _markProductAsFavorite(Params(productId: productId));

    var newState = result.fold(
      (l) => BookmarksLoadFailed(state.favourites),
      (r) => BookmarksLoaded(r),
    );
    emit(newState);
  }
}
