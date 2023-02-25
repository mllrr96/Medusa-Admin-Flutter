import 'package:dio/dio.dart';
import 'package:medusa_admin/core/utils/strings.dart';
import '../../../service/storage_service.dart';

class DioClient {
  final Dio dio;
  final String baseUrl;
  final Map<String, dynamic>? headers;
  DioClient({
    required this.dio,
    required this.baseUrl,
    this.headers,
  }) {
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 6)
      ..options.receiveTimeout = const Duration(seconds: 6)
      ..httpClientAdapter
      ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
        String? cookie = StorageService.cookie;
        if (cookie != null && cookie.isNotEmpty) {
          options.headers[AppConstants.cookie] = cookie;
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
      baseUrl + uri,
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
    // try {
    var response = await dio.post(
      baseUrl + uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
    // } on FormatException catch (_) {
    //   throw const FormatException("Unable to process the data");
    // } catch (e) {
    //   rethrow;
    // }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    var response = await dio.put(
      baseUrl + uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return response;
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var response = await dio.delete(
      uri,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response;
  }
}
