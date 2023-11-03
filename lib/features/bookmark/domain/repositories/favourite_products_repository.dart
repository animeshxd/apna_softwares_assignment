import 'package:apna_softwares_assignment/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class FavouriteProductsRepository {
  Either<Failure, Set<int>> markAsFavorite(int productId);
  Either<Failure, Set<int>> removeFromFavourites(int productId);
  Either<Failure, Set<int>> getFavorites();
}
