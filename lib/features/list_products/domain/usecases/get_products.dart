import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

@lazySingleton
class GetProducts implements UseCase<List<Product>, GetProductsParams> {
  final ProductsRepository repository;

  GetProducts({required this.repository});

  @override
  Future<Either<Failure, List<Product>>> call(params) {
    return repository.getProducts(params.page);
  }
}

class GetProductsParams extends Equatable {
  final int page;

  const GetProductsParams({required this.page});

  @override
  List<Object?> get props => [page];
}
