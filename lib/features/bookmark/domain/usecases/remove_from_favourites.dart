import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/favourite_products_repository.dart';
import 'params.dart';

@lazySingleton
class RemoveProductFromFavourites extends UseCase<Set<int>, Params> {
  final FavouriteProductsRepository repository;

  RemoveProductFromFavourites({required this.repository});

  @override
  Future<Either<Failure, Set<int>>> call(Params params) async {
    return repository.removeFromFavourites(params.productId);
  }
}
