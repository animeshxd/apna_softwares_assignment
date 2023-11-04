import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../error/exceptions.dart';
import '../models/product.dart';

abstract class ProductsRemoteDataSource {
  Future<List<ProductModel>> getProducts([int nextPage = 1]);
}

@LazySingleton(as: ProductsRemoteDataSource)
class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final http.Client client;

  ProductsRemoteDataSourceImpl({required this.client});

  static const ENDPOINT =
      "https://app.apnabillbook.com/api/product?storeId=4ad3de84-bcaa-4bb2-9eb9-1846844e3314";

  @override
  Future<List<ProductModel>> getProducts([int page = 1]) async {
    final response = await client
        .get(Uri.parse("$ENDPOINT&page=$page&pageSize=10"))
        .catchError((err) => throw ConnectionException());

    if (response.statusCode != 200) {
      throw ServerException();
    }

    var jsonData = json.decode(response.body) as Map<String, dynamic>;

    return List<ProductModel>.from(
      (jsonData['data']?['data'] ?? []).map((e) {
        try {
          return ProductModel.fromJson(e);
        } catch (_) {
          log("Failed to Serialize Model object on page $page, $e", error: _);
          throw JSONSerializeModelFailedException(e);
        }
      }),
    );
  }
}

void main(List<String> args) async {
  await ProductsRemoteDataSourceImpl(client: http.Client()).getProducts();
}
