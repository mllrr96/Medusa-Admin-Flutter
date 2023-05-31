import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/publishable_api_keys.dart';
import 'package:medusa_admin/app/data/models/res/sales_channel_res.dart';
import 'package:medusa_admin/app/data/repository/publishable_api_key/base_publishable_api_key.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class PublishableApiKeyRepo extends BasePublishableApiKey {
  final _dataProvider = DioClient(dio: Dio());

  @override
  Future<Result<UserPublishableApiKeyRes, Failure>> addSalesChannels({
    required String id,
    required List<String> salesChannelsIds,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      var data = <Map<String, dynamic>>[];
      for (var id in salesChannelsIds) {
        data.add({'id': id});
      }
      final response = await _dataProvider.post(
        uri: '/publishable-api-keys/$id/sales-channels/batch',
        data: {
          'sales_channel_ids': data,
        },
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserPublishableApiKeyRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserPublishableApiKeyRes, Failure>> createPublishableApiKey({
    required String title,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/publishable-api-keys',
        data: {
          'title': title,
        },
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserPublishableApiKeyRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserPublishableApiKeyRes, Failure>> deletePublishableApiKey({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/publishable-api-keys/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserPublishableApiKeyRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserDeletePublishableApiKeyRes, Failure>> deleteSalesChannels({
    required String id,
    required List<String> salesChannelsIds,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      var data = <Map<String, dynamic>>[];
      for (var id in salesChannelsIds) {
        data.add({'id': id});
      }
      final response = await _dataProvider.delete(
        '/publishable-api-keys/$id/sales-channels/batch',
        data: {
          'sales_channel_ids': data,
        },
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserDeletePublishableApiKeyRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserPublishableApiKeyRes, Failure>> retrievePublishableApiKey({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/publishable-api-keys/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserPublishableApiKeyRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRetrievePublishableApiKeysRes, Failure>> retrievePublishableApiKeys({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/publishable-api-keys',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrievePublishableApiKeysRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserSalesChannelRetrieveAllRes, Failure>> retrieveSalesChannels({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/publishable-api-keys/$id/sales-channels',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserSalesChannelRetrieveAllRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserPublishableApiKeyRes, Failure>> revokePublishableApiKey({
    required String id,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/publishable-api-keys/$id/revoke',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserPublishableApiKeyRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserPublishableApiKeyRes, Failure>> updatePublishableApiKey({
    required String id,
    String? title,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/publishable-api-keys/$id',
        data: {
          'title': title,
        },
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserPublishableApiKeyRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
