import 'catalog_best_item.dart';
import 'catalog_hot_item.dart';

class Catalog {
  final List<CatalogHotItem> homeStore;
  final List<CatalogBestItem> bestSeller;

  const Catalog({
    required this.homeStore,
    required this.bestSeller,
  });
}
