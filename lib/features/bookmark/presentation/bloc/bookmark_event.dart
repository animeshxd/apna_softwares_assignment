part of 'bookmark_bloc.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class GetFavouriteProducts extends BookmarkEvent {}

class RemoveProductFromFavourites extends BookmarkEvent {
  final int productId;

  const RemoveProductFromFavourites({required this.productId});
  @override
  List<Object> get props => [productId];
}

class AddProductToFavorites extends BookmarkEvent {
  final int productId;

  const AddProductToFavorites({required this.productId});
  @override
  List<Object> get props => [productId];
}
