import 'package:multiple_result/multiple_result.dart';

import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_customer_req.dart';
import '../../models/res/customer.dart';

abstract class BaseCustomer {
  /// Retrieves a list of Customers
  Future<Result<CustomersRes, Failure>> retrieveCustomers({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Retrieves a customer
  Future<Result<CustomerRes, Failure>> retrieve({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Updates a customer
  Future<Result<CustomerRes, Failure>> update({
    required String id,
    required UserUpdateCustomerReq userUpdateCustomerReq,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Create a customer
  Future<Result<CustomerRes, Failure>> create({
    required UserCreateCustomerReq userCreateCustomerReq,

    Map<String, dynamic>? customHeaders,
  });
}
