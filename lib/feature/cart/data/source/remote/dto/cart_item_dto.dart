import 'package:json_annotation/json_annotation.dart';

part 'cart_item_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CartItemDto {
  final int id;
  final String images;
  final int price;
  final String title;

  const CartItemDto({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });

  factory CartItemDto.fromJson(Map<String, dynamic> json) =>
      _$CartItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemDtoToJson(this);
}
