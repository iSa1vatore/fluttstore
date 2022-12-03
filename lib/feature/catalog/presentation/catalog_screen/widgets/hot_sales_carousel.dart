import 'package:flutter/material.dart';

import '../../../domain/model/catalog_hot_item.dart';
import 'hot_sale_item.dart';

class HotSalesCarousel extends StatefulWidget {
  final List<CatalogHotItem> items;
  final void Function(int id) onItemPressed;

  const HotSalesCarousel(
    this.items, {
    required this.onItemPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<HotSalesCarousel> createState() => _HotSalesCarouselState();
}

class _HotSalesCarouselState extends State<HotSalesCarousel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemBuilder: (_, index) => HotSaleItem(
          widget.items[index],
          onItemPressed: widget.onItemPressed,
        ),
        itemCount: widget.items.length,
      ),
    );
  }
}
