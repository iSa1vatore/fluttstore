import 'package:fluttstore/feature/product/data/source/remote/dto/product_dto.dart';
import 'package:fluttstore/feature/product/domain/model/product.dart';

extension ProductDtoToProductExt on ProductDto {
  Product toProduct() => Product(
        id: id,
        title: title,
        cpu: cpu,
        camera: camera,
        capacity: capacity,
        color: color,
        images: images,
        isFavorite: isFavorites,
        price: price,
        rating: rating,
        ram: ssd,
        storage: sd,
      );
}
