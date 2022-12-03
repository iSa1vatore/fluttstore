class Product {
  final String id;
  final String title;
  final String cpu;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final List<String> images;
  final bool isFavorite;
  final int price;
  final double rating;
  final String ram;
  final String storage;

  const Product({
    required this.id,
    required this.title,
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.images,
    required this.isFavorite,
    required this.price,
    required this.rating,
    required this.ram,
    required this.storage,
  });
}
