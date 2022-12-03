import 'package:dio/dio.dart';
import 'package:fluttstore/feature/cart/data/source/remote/dto/cart_infos_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'cart_remote_ds.g.dart';

@RestApi()
abstract class CartRemoteDataSource {
  factory CartRemoteDataSource(Dio dio) = _CartRemoteDataSource;

  @GET('/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149')
  Future<CartInfosDto> fetch();
}
