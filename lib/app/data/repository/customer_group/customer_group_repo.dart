import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';

import 'package:medusa_admin/app/data/models/res/customer_group.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../service/dio_service.dart';
import 'customer_group_base.dart';

class CustomerGroupRepo extends BaseCustomerGroup {
  final _dataProvider = DioService.instance.dio;

  @override
  Future<Result<UserAddCustomersRes, Failure>> addCustomers({
    required String id,
    required List<String> customerIds,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      var data = <Map<String, dynamic>>[];
      for (var id in customerIds) {
        data.add({'id': id});
      }

      final response = await _dataProvider.post(
        uri: '/customer-groups/$id/customers/batch',
        data: {
          'customer_ids': data,
        },
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserAddCustomersRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserCreateCustomerGroupRes, Failure>> createCustomerGroup({
    required String name,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/customer-groups',
        queryParameters: queryParameters,
        data: {
          'name': name,
          if (metadata != null) 'metadata': metadata,
        },
      );
      if (response.statusCode == 200) {
        return Success(UserCreateCustomerGroupRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserDeleteCustomerGroupRes, Failure>> deleteCustomerGroup({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/customer-groups/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteCustomerGroupRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Removes a list of customers, represented by id's, from a customer group.
  @override
  Future<Result<UserRemoveCustomersRes, Failure>> removeCustomers({
    /// The ID of the customer group.
    required String id,

    /// The ids of the customers to remove
    required List<String> customerIds,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      var data = <Map<String, dynamic>>[];
      for (var id in customerIds) {
        data.add({'id': id});
      }
      final response = await _dataProvider.delete(
        '/customer-groups/$id/customers/batch',
        data: {
          'customer_ids': data,
        },
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRemoveCustomersRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRetrieveCustomerGroupRes, Failure>> retrieveCustomerGroup({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/customer-groups/$id',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveCustomerGroupRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRetrieveCustomerGroupsRes, Failure>> retrieveCustomerGroups({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/customer-groups',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveCustomerGroupsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a list of customers in a customer group
  @override
  Future<Result<UserRetrieveCustomersRes, Failure>> retrieveCustomers({
    /// The ID of the customer group.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/customer-groups/$id/customers',
        queryParameters: queryParameters,
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveCustomersRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserRetrieveCustomerGroupRes, Failure>> updateCustomerGroup({
    required String id,
    required String name,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/customer-groups/$id',
        queryParameters: queryParameters,
        data: {
          'name': name,
          if (metadata != null) 'metadata': metadata,
        },
      );
      if (response.statusCode == 200) {
        return Success(UserRetrieveCustomerGroupRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
