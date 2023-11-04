import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class FavouriteProductsRepository {
  Either<Failure, Set<int>> markAsFavorite(int productId);
  Either<Failure, Set<int>> removeFromFavourites(int productId);
  Either<Failure, Set<int>> getFavorites();
}
