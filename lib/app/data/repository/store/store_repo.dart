import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/repository/store/base_store.dart';

import '../../../../core/utils/strings.dart';
import '../../datasource/remote/dio/dio_client.dart';
import '../../models/res/store.dart';

class StoreRepo extends BaseStore {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: AppConstants.baseUrl);

  @override
  Future<Either<UserStoreRes, Failure>> retrieve(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    if (customHeaders != null) {
      _dataProvider.dio.options.headers.addAll(customHeaders);
    }
    try {
      final response = await _dataProvider.get(uri: '/admin/store', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return Left(UserStoreRes.fromJson(response.data));
      } else {
        return right(Failure(error: ''));
      }
    } catch (e) {
      return right(Failure(error: e));
    }
  }
}
