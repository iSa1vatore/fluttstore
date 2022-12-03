import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttstore/feature/product/domain/model/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repository/product_repository.dart';

part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;

  ProductBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const ProductState.loading()) {
    on<ProductInitEvent>(_loadDetails);
    on<ProductChangeColorEvent>(_onChangeColor);
    on<ProductChangeCapacityEvent>(_onChangeCapacity);
  }

  Future<void> _loadDetails(
    ProductInitEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductState.loading());

    try {
      final product = await _productRepository.fetchById(event.id);

      emit(ProductState.success(product: product));
    } on Exception {
      emit(const ProductState.error());
    }
  }

  void _onChangeColor(
    ProductChangeColorEvent event,
    Emitter<ProductState> emit,
  ) =>
      emit(state.copyWith(selectedColor: event.index));

  void _onChangeCapacity(
    ProductChangeCapacityEvent event,
    Emitter<ProductState> emit,
  ) =>
      emit(state.copyWith(selectedCapacity: event.index));
}

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.init({
    required int id,
  }) = ProductInitEvent;

  const factory ProductEvent.changeColor({
    required int index,
  }) = ProductChangeColorEvent;

  const factory ProductEvent.changeCapacity({
    required int index,
  }) = ProductChangeCapacityEvent;
}

@freezed
class ProductState with _$ProductState {
  const ProductState._();

  const factory ProductState.loading({
    @Default(0) int selectedColor,
    @Default(0) int selectedCapacity,
  }) = _ProductInitState;

  const factory ProductState.success({
    required Product product,
    @Default(0) int selectedColor,
    @Default(0) int selectedCapacity,
  }) = ProductSuccessState;

  const factory ProductState.error({
    @Default(0) int selectedColor,
    @Default(0) int selectedCapacity,
  }) = _ProductErrorState;
}
