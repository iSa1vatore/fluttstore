class CatalogBestItem {
  final int id;
  final bool isFavorites;
  final String title;
  final int priceWithoutDiscount;
  final int discountPrice;
  final String picture;

  const CatalogBestItem({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });
}
