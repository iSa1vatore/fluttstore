import 'package:json_annotation/json_annotation.dart';

part 'catalog_best_item_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CatalogBestItemDto {
  final int id;
  @JsonKey(name: 'is_favorites')
  final bool isFavorites;
  final String title;
  @JsonKey(name: 'price_without_discount')
  final int priceWithoutDiscount;
  @JsonKey(name: 'discount_price')
  final int discountPrice;
  final String picture;

  const CatalogBestItemDto({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  factory CatalogBestItemDto.fromJson(Map<String, dynamic> json) =>
      _$CatalogBestItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogBestItemDtoToJson(this);
}
