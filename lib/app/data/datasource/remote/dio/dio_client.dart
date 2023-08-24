import 'package:dio/dio.dart';
import 'package:medusa_admin/core/utils/strings.dart';
import '../../../service/storage_service.dart';

class DioClient {
  final Dio dio;
  final Map<String, dynamic>? headers;
  DioClient({
    required this.dio,
    this.headers,
  }) {
    dio
      ..options.baseUrl = StorageService.baseUrl
      ..options.connectTimeout = const Duration(milliseconds: 8000)
      // ..options.receiveTimeout = const Duration(milliseconds: 6000)
      ..options.sendTimeout = const Duration(milliseconds: 6000)
      ..httpClientAdapter
      ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
        String? cookie = StorageService.cookie;
        if (cookie != null && cookie.isNotEmpty) {
          options.headers[AppConstants.cookieKey] = cookie;
        }
        return handler.next(options);
      }))
      ..options.headers = headers ??
          {
            "Accept": "application/json",
            "Content-Type": "application/json",
          };
  }

  Future<Response> get({
    required String uri,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await dio.get(
      uri,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> post({
    required String uri,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await dio.post(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> put({
    required String uri,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    return await dio.put(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await dio.delete(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
