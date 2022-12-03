import 'package:fluttstore/feature/cart/data/mapper/cart_infos.dart';
import 'package:fluttstore/feature/cart/data/source/remote/cart_remote_ds.dart';

import '../../domain/model/cart_infos.dart';

class CartRepository {
  final CartRemoteDataSource _remoteDataSource;

  const CartRepository({
    required CartRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  Future<CartInfos> fetch() async {
    final result = await _remoteDataSource.fetch();

    return result.toCartInfos();
  }
}
