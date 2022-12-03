import 'package:fluttstore/feature/catalog/data/mapper/catalog_item.dart';
import 'package:fluttstore/feature/catalog/domain/model/catalog.dart';

import '../source/remote/dto/catalog_dto.dart';

extension CatalogDtoToCatalog on CatalogDto {
  Catalog toCatalog() => Catalog(
        homeStore: homeStore
            .map(
              (itemDto) => itemDto.toCatalogHotItem(),
            )
            .toList(),
        bestSeller: bestSeller
            .map(
              (itemDto) => itemDto.toCatalogBestItem(),
            )
            .toList(),
      );
}
