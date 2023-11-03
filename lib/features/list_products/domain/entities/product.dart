import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String? createdAt;
  final int mrp;

  const Product({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.mrp,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
