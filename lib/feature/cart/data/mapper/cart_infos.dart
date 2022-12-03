import 'package:fluttstore/feature/cart/data/mapper/cart_item.dart';
import 'package:fluttstore/feature/cart/domain/model/cart_infos.dart';

import '../source/remote/dto/cart_infos_dto.dart';

extension CartInfosDtoToCartInfos on CartInfosDto {
  CartInfos toCartInfos() => CartInfos(
        items: basket.map((itemDto) => itemDto.toCartItem()).toList(),
        delivery: delivery,
        id: id,
        total: total,
      );
}
