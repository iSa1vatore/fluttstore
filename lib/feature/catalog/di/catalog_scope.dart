import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttstore/feature/catalog/data/repository/catalog_repository.dart';
import 'package:fluttstore/feature/catalog/data/source/remote/catalog_remote_ds.dart';
import 'package:provider/provider.dart';

import '../presentation/catalog_screen/bloc/catalog_bloc.dart';

class CatalogScopeImpl implements CatalogScope {
  late final CatalogRemoteDataSource _catalogRemoteDataSource;
  late final CatalogRepository _catalogRepository;
  late final CatalogBloc _catalogBloc;

  @override
  CatalogBloc get catalogBloc => _catalogBloc;

  CatalogScopeImpl({required Dio dio}) {
    _catalogRemoteDataSource = CatalogRemoteDataSource(dio);
    _catalogRepository = CatalogRepository(
      remoteDataSource: _catalogRemoteDataSource,
    );
    _catalogBloc = CatalogBloc(catalogRepository: _catalogRepository);
  }
}

abstract class CatalogScope {
  CatalogBloc get catalogBloc;
}

extension CatalogScopeExt on BuildContext {
  CatalogScope get catalogScope => read();
}
