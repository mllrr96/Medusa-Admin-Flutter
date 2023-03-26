import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';

import 'package:medusa_admin/app/data/models/res/customer_group.dart';
import 'package:multiple_result/multiple_result.dart';


import 'customer_group_base.dart';

class CustomerGroupRepository extends BaseCustomerGroup{
  @override
  Future<Result<UserAddCustomersRes, Failure>> addCustomers({required String id, required List<String> customerIds, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement addCustomers
    throw UnimplementedError();
  }

  @override
  Future<Result<UserCreateCustomerGroupRes, Failure>> createCustomerGroup({required String id, Map<String, dynamic>? metadata, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement createCustomerGroup
    throw UnimplementedError();
  }

  @override
  Future<Result<UserDeleteCustomerGroupRes, Failure>> deleteCustomerGroup({required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement deleteCustomerGroup
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRemoveCustomersRes, Failure>> removeCustomers({required String id, required List<String> customerIds, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement removeCustomers
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveCustomerGroupRes, Failure>> retrieveCustomerGroup({required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement retrieveCustomerGroup
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveCustomerGroupsRes, Failure>> retrieveCustomerGroups({Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement retrieveCustomerGroups
    throw UnimplementedError();
  }

  @override
  Future<Result<UserAddCustomersRes, Failure>> retrieveCustomers({required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement retrieveCustomers
    throw UnimplementedError();
  }

  @override
  Future<Result<UserRetrieveCustomerGroupRes, Failure>> updateCustomerGroup({required String id, required String name, Map<String, dynamic>? metadata, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters}) {
    // TODO: implement updateCustomerGroup
    throw UnimplementedError();
  }
}