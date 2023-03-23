import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:medusa_admin/app/data/models/res/customer.dart';
import 'package:medusa_admin/app/data/repository/customer/base_customer.dart';

import '../../datasource/remote/dio/dio_client.dart';
import '../../service/storage_service.dart';

class CustomerRepository extends BaseCustomer {
  final _dataProvider = DioClient(dio: Dio(), baseUrl: StorageService.baseUrl);
// TODO: rework this
  @override
  Future<CustomersRes?> retrieveCustomers(
      {Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/customers',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return CustomersRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }

  @override
  Future<CustomerRes?> retrieve(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/customers/$id', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return CustomerRes.fromJson(response.data);
      } else {
        throw response.statusCode!;
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      rethrow;
    }
  }
}
