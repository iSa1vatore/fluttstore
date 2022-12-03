import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repository/catalog_repository.dart';
import '../../../domain/model/catalog_best_item.dart';
import '../../../domain/model/catalog_hot_item.dart';

part 'catalog_bloc.freezed.dart';

class CatalogBloc extends Bloc<CatalogEvent, CatalogState> {
  final CatalogRepository _catalogRepository;

  CatalogBloc({required CatalogRepository catalogRepository})
      : _catalogRepository = catalogRepository,
        super(const CatalogState.loading()) {
    on<CatalogInitEvent>(_loadCatalog);
    on<CatalogChangeCategoryEvent>(_changeCategory);
  }

  Future<void> _loadCatalog(
    CatalogInitEvent event,
    Emitter<CatalogState> emit,
  ) async {
    emit(const CatalogState.loading());

    try {
      final catalog = await _catalogRepository.fetch();

      emit(CatalogState.success(
        hotSales: catalog.homeStore,
        bestSeller: catalog.bestSeller,
      ));
    } on Exception {
      emit(const CatalogState.error());
    }
  }

  void _changeCategory(
    CatalogChangeCategoryEvent event,
    Emitter<CatalogState> emit,
  ) {
    emit(state.copyWith(categoryId: event.id));
  }
}

@freezed
class CatalogEvent with _$CatalogEvent {
  const factory CatalogEvent.init() = CatalogInitEvent;
  const factory CatalogEvent.changeCategory(
    int id,
  ) = CatalogChangeCategoryEvent;
}

@freezed
class CatalogState with _$CatalogState {
  const CatalogState._();

  const factory CatalogState.loading({
    @Default(1) int categoryId,
  }) = _CatalogInitState;

  const factory CatalogState.success({
    required List<CatalogHotItem> hotSales,
    required List<CatalogBestItem> bestSeller,
    @Default(1) int categoryId,
  }) = _CatalogSuccessState;

  const factory CatalogState.error({
    @Default(1) int categoryId,
  }) = _CatalogErrorState;
}
