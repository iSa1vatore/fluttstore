import 'package:json_annotation/json_annotation.dart';

import 'cart_item_dto.dart';

part 'cart_infos_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CartInfosDto {
  final List<CartItemDto> basket;
  final String delivery;
  final String id;
  final int total;

  const CartInfosDto({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  factory CartInfosDto.fromJson(Map<String, dynamic> json) =>
      _$CartInfosDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartInfosDtoToJson(this);
}
