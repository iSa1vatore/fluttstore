import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/product_dto.dart';

part 'product_remote_ds.g.dart';

@RestApi()
abstract class ProductRemoteDataSource {
  factory ProductRemoteDataSource(Dio dio) = _ProductRemoteDataSource;

  @GET('/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5')
  Future<ProductDto> fetchById(@Path('id') int id);
}
