import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/favourite_products_repository.dart';

@lazySingleton
class GetFavoritesProducts extends UseCase<Set<int>, NoParams> {
  final FavouriteProductsRepository repository;

  GetFavoritesProducts({required this.repository});

  @override
  Future<Either<Failure, Set<int>>> call(
      [NoParams params = const NoParams()]) async {
    return repository.getFavorites();
  }
}
