import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttstore/feature/navigation/navigation.dart';
import 'package:provider/provider.dart';

class AppScopeImpl implements AppScope {
  late final Dio _dio;
  late final AppRouter _router;

  @override
  Dio get dio => _dio;

  @override
  AppRouter get router => _router;

  AppScopeImpl() {
    _router = AppRouter();
    _dio = _initDio();
  }

  Dio _initDio() {
    const timeout = Duration(seconds: 30);

    final dio = Dio();

    dio.options
      ..baseUrl = 'https://run.mocky.io/'
      ..connectTimeout = timeout.inMilliseconds
      ..receiveTimeout = timeout.inMilliseconds
      ..sendTimeout = timeout.inMilliseconds;

    return dio;
  }
}

abstract class AppScope {
  Dio get dio;

  AppRouter get router;
}

extension AppScopeExt on BuildContext {
  AppScope get appScope => read();
}
