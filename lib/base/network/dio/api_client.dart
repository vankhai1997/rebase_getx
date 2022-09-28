import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'networks.dart';

class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.options.baseUrl = dotenv.get('BASE_URL');
    dio.options.connectTimeout = const Duration(minutes: 5).inMilliseconds;
    dio.options.receiveTimeout = const Duration(minutes: 5).inMilliseconds;
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
    }
    dio.interceptors.add(BaseInterceptors(dio));
  }

  Future<Response> post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool? loading,
      bool? upload,
      Function(CancelToken cancelToken)? onCancel}) async {
    final cancelToken = CancelToken();
    final res = await dio.post(path,
        data: data, queryParameters: queryParameters, cancelToken: cancelToken);
    if (onCancel != null) {
      onCancel(cancelToken);
    }
    return res;
  }

  Future<Response> put(String path,
      {dynamic data, Map<String, dynamic>? query, bool? loading}) async {
    final res = await dio.put(path, data: data, queryParameters: query);
    return res;
  }

  Future<Response> delete(String path,
      {Map<String, dynamic>? param,
      bool? loading,
      Map<String, dynamic>? data}) async {
    final res = await dio.delete(path, queryParameters: param, data: data);
    return res;
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? param, bool? loading}) async {
    final res = await dio.get(path, queryParameters: param);
    return res;
  }
}
