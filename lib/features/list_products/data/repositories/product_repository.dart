import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../error/exceptions.dart';
import '../datasources/products_remote_data_source.dart';
@LazySingleton(as: ProductsRepository)
class ProductRepositoryImpl extends ProductsRepository {
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductRepositoryImpl({required this.productsRemoteDataSource});

  @override
  Future<Either<Failure, List<Product>>> getProducts([int page = 1]) async {
    try {
      var products = await productsRemoteDataSource.getProducts(page);
      return right(products);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } on ConnectionException catch (_) {
      return left(ConnectionFailure());
    } catch (_) {
      return left(UnhandledFailure());
    }
  }
}
