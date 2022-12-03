import 'package:fluttstore/feature/catalog/data/mapper/catalog.dart';

import '../../domain/model/catalog.dart';
import '../source/remote/catalog_remote_ds.dart';

class CatalogRepository {
  final CatalogRemoteDataSource _remoteDataSource;

  const CatalogRepository({
    required CatalogRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  Future<Catalog> fetch() async {
    final result = await _remoteDataSource.fetch();

    return result.toCatalog();
  }
}
