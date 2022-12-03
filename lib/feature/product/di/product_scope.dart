import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttstore/feature/product/data/repository/product_repository.dart';
import 'package:fluttstore/feature/product/data/source/remote/product_remote_ds.dart';
import 'package:fluttstore/feature/product/presentation/product_screen/bloc/product_bloc.dart';
import 'package:provider/provider.dart';

class ProductScopeImpl implements ProductScope {
  late final ProductRepository _productRepository;
  late final ProductRemoteDataSource _productRemoteDataSource;

  @override
  ProductBloc get productBloc => ProductBloc(
        productRepository: _productRepository,
      );

  ProductScopeImpl({required Dio dio}) {
    _productRemoteDataSource = ProductRemoteDataSource(dio);
    _productRepository = ProductRepository(
      remoteDataSource: _productRemoteDataSource,
    );
  }
}

abstract class ProductScope {
  ProductBloc get productBloc;
}

extension ProductScopeExt on BuildContext {
  ProductScope get productScope => read();
}
