import 'package:fluttstore/feature/cart/domain/model/cart_item.dart';

import '../source/remote/dto/cart_item_dto.dart';

extension CartItemDtoToCartItem on CartItemDto {
  CartItem toCartItem() => CartItem(
        id: id,
        image: images,
        price: price,
        title: title,
      );
}
