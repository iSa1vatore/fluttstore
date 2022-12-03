import '../../domain/model/product.dart';
import '../mapper/product.dart';
import '../source/remote/product_remote_ds.dart';

class ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;

  const ProductRepository({
    required ProductRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  Future<Product> fetchById(int id) async {
    final result = await _remoteDataSource.fetchById(id);

    return result.toProduct();
  }
}
