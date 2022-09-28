import 'dart:async';

import 'package:dio/dio.dart';

class BaseInterceptors extends InterceptorsWrapper {
  bool? showLoading;
  final Dio dio;

  BaseInterceptors(this.dio);

  @override
  Future<RequestOptions> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
    final cancelToken = CancelToken();
    final headers = <String, dynamic>{};
    headers["lang"] = 'vi';
    options.cancelToken = cancelToken;
    options.headers.addAll(headers);

    return options.copyWith(sendTimeout: 60000, receiveTimeout: 600000);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
  }

  Future<Response> retryToken(Response response) async {
    return response;
  }
}
