import 'package:apna_softwares_assignment/core/error/failure.dart';
import 'package:apna_softwares_assignment/features/bookmark/domain/repositories/favourite_products_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../datasources/favourite_products_local_data_source.dart';

@LazySingleton(as: FavouriteProductsRepository)
class FavouriteProductsRepositoryImpl extends FavouriteProductsRepository {
  final FavouriteProductsLocalDataSource favouriteProductsLocalDataSource;

  FavouriteProductsRepositoryImpl({
    required this.favouriteProductsLocalDataSource,
  });

  @override
  Either<Failure, Set<int>> getFavorites() {
    return right(favouriteProductsLocalDataSource.getFavorites());
  }

  @override
  Either<Failure, Set<int>> markAsFavorite(int productId) {
    var favourites = favouriteProductsLocalDataSource.markAsFavorite(productId);

    return right(favourites);
  }

  @override
  Either<Failure, Set<int>> removeFromFavourites(int productId) {
    var favourites =
        favouriteProductsLocalDataSource.removeFromFavourite(productId);
    return right(favourites);
  }
}
