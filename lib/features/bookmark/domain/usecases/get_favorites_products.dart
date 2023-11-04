import 'package:apna_softwares_assignment/core/error/failure.dart';
import 'package:apna_softwares_assignment/core/usecases/usecase.dart';
import 'package:apna_softwares_assignment/features/bookmark/domain/repositories/favourite_products_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

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
