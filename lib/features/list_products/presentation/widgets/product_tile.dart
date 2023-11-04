import 'package:flutter/material.dart';

import '../../../bookmark/presentation/widgets/add_to_favourite_button.dart';
import '../../domain/entities/product.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text("₹ ${product.mrp}"),
      trailing: AddToFavouriteButton(
        productId: product.id,
      ),
    );
  }
}
