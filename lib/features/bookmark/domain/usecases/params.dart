import 'package:equatable/equatable.dart';

class Params extends Equatable {
  final int productId;

  const Params({required this.productId});

  @override
  List<Object?> get props => [productId];
}
