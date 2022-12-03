import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'dto/catalog_dto.dart';

part 'catalog_remote_ds.g.dart';

@RestApi()
abstract class CatalogRemoteDataSource {
  factory CatalogRemoteDataSource(Dio dio) = _CatalogRemoteDataSource;

  @GET('/v3/654bd15e-b121-49ba-a588-960956b15175')
  Future<CatalogDto> fetch();
}
