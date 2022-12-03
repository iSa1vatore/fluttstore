import 'package:json_annotation/json_annotation.dart';

part 'catalog_hot_item_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CatalogHotItemDto {
  final int id;
  @JsonKey(name: 'is_new')
  final bool? isNew;
  final String title;
  final String subtitle;
  final String picture;
  @JsonKey(name: 'is_buy')
  final bool isBuy;

  const CatalogHotItemDto({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
    this.isNew,
  });

  factory CatalogHotItemDto.fromJson(Map<String, dynamic> json) =>
      _$CatalogHotItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogHotItemDtoToJson(this);
}
