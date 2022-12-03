import 'package:json_annotation/json_annotation.dart';

import 'catalog_best_item_dto.dart';
import 'catalog_hot_item_dto.dart';

part 'catalog_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CatalogDto {
  @JsonKey(name: 'home_store')
  final List<CatalogHotItemDto> homeStore;
  @JsonKey(name: 'best_seller')
  final List<CatalogBestItemDto> bestSeller;

  const CatalogDto({
    required this.homeStore,
    required this.bestSeller,
  });

  factory CatalogDto.fromJson(Map<String, dynamic> json) =>
      _$CatalogDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogDtoToJson(this);
}
