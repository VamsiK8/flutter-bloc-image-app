import 'package:image_bloc_app/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.image,
    required super.price,
    required super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
      price: map['price'].toDouble(),
      rating: map['rating']['rate'].toDouble(),
    );
  }
}
