import 'package:image_bloc_app/features/products/data/datasources/product_remote_data_source.dart';

import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> fetchProducts() async {
    try {
      final result = await remoteDataSource.fetchProducts();

      return result;
    } catch (e) {
      throw Exception("Repository Error: $e");
    }
  }
}
