import 'cart_item.dart';

class CartInfos {
  final List<CartItem> items;
  final String delivery;
  final String id;
  final int total;

  const CartInfos({
    required this.items,
    required this.delivery,
    required this.id,
    required this.total,
  });
}
