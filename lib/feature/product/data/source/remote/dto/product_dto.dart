import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDto {
  final String id;
  final String title;
  @JsonKey(name: 'CPU')
  final String cpu;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final List<String> images;
  final bool isFavorites;
  final int price;
  final double rating;
  final String sd;
  final String ssd;

  const ProductDto({
    required this.id,
    required this.title,
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);
}
