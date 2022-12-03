import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repository/cart_repository.dart';
import '../../../domain/model/cart_item.dart';

part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;

  CartBloc({required CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(const CartState.loading()) {
    on<CartInitEvent>(_load);
  }

  Future<void> _load(
    CartInitEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(const CartState.loading());

    try {
      final cartInfos = await _cartRepository.fetch();

      emit(CartState.success(
        items: cartInfos.items,
        delivery: cartInfos.delivery,
        total: cartInfos.total,
      ));
    } on Exception {
      emit(const CartState.error());
    }
  }
}

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.init() = CartInitEvent;
}

@freezed
class CartState with _$CartState {
  const CartState._();

  const factory CartState.loading() = _CartInitState;

  const factory CartState.error() = _CartErrorState;

  const factory CartState.success({
    required List<CartItem> items,
    required String delivery,
    required int total,
  }) = CartSuccessState;
}
