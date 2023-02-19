import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/res/collection.dart';
import '../../../../core/utils/strings.dart';
import '../../datasource/remote/dio/dio_client.dart';
import 'base_collection.dart';

class CollectionRepo extends BaseCollection {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: AppConstants.baseUrl);

  @override
  Future<Either<UserCollectionRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement retrieve
    throw UnimplementedError();
  }

  @override
  Future<Either<UserCollectionsRes, Failure>> retrieveAll(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(
        uri: '/collections',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Left(UserCollectionsRes.fromJson(response.data));
      } else {
        return right(Failure(error: ''));
      }
    } catch (e) {
      return right(Failure(error: e));
    }
  }
}
