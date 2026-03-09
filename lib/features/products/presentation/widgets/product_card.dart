import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),

      child: ListTile(
        leading: Image.network(product.image, width: 50, height: 50),

        title: Text(product.title),

        subtitle: Text("\$${product.price}"),
      ),
    );
  }
}
