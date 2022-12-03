import 'package:fluttstore/feature/catalog/domain/model/catalog_best_item.dart';
import 'package:fluttstore/feature/catalog/domain/model/catalog_hot_item.dart';

import '../source/remote/dto/catalog_best_item_dto.dart';
import '../source/remote/dto/catalog_hot_item_dto.dart';

extension CatalogBestItemDtoToCatalogBestItem on CatalogBestItemDto {
  CatalogBestItem toCatalogBestItem() => CatalogBestItem(
        id: id,
        isFavorites: isFavorites,
        title: title,
        priceWithoutDiscount: priceWithoutDiscount,
        discountPrice: discountPrice,
        picture: picture,
      );
}

extension CatalogHotItemDtoToCatalogHotItem on CatalogHotItemDto {
  CatalogHotItem toCatalogHotItem() => CatalogHotItem(
        id: id,
        isNew: isNew ?? false,
        title: title,
        subtitle: subtitle,
        picture: picture,
        isBuy: isBuy,
      );
}
