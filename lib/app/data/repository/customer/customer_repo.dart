import 'dart:developer';
import 'package:medusa_admin/app/data/service/dio_service.dart';
import 'package:medusa_admin/app/data/models/res/customer.dart';
import 'package:medusa_admin/app/data/repository/customer/base_customer.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';

class CustomerRepository extends BaseCustomer {
  final _dataProvider = DioService.instance.dio;
  @override
  Future<Result<CustomersRes, Failure>> retrieveCustomers(
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
        return Success(CustomersRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<CustomerRes, Failure>> retrieve(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(uri: '/customers/$id', queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return Success(CustomerRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
