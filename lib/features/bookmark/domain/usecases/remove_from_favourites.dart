import 'package:apna_softwares_assignment/core/error/failure.dart';
import 'package:apna_softwares_assignment/core/usecases/usecase.dart';
import 'package:apna_softwares_assignment/features/bookmark/domain/repositories/favourite_products_repository.dart';
import 'package:apna_softwares_assignment/features/bookmark/domain/usecases/params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoveFromFavourites extends UseCase<Set<int>, Params> {
  final FavouriteProductsRepository repository;

  RemoveFromFavourites({required this.repository});

  @override
  Future<Either<Failure, Set<int>>> call(Params params) async {
    return repository.removeFromFavourites(params.productId);
  }
}