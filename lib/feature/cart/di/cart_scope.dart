import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttstore/feature/cart/data/repository/cart_repository.dart';
import 'package:fluttstore/feature/cart/data/source/remote/cart_remote_ds.dart';
import 'package:provider/provider.dart';

import '../presentation/cart_screen/bloc/cart_bloc.dart';

class CartScopeImpl implements CartScope {
  late final CartRemoteDataSource _cartRemoteDataSource;
  late final CartRepository _cartRepository;
  late final CartBloc _cartBloc;

  @override
  CartBloc get cartBloc => _cartBloc;

  CartScopeImpl({required Dio dio}) {
    _cartRemoteDataSource = CartRemoteDataSource(dio);
    _cartRepository = CartRepository(remoteDataSource: _cartRemoteDataSource);

    _cartBloc = CartBloc(cartRepository: _cartRepository);
    _cartBloc.add(const CartEvent.init());
  }
}

abstract class CartScope {
  CartBloc get cartBloc;
}

extension CartScopeExt on BuildContext {
  CartScope get cartScope => read();
}
