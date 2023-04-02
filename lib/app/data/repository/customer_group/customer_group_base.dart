import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../models/res/customer_group.dart';

abstract class BaseCustomerGroup {
  /// Retrieve a list of customer groups.
  Future<Result<UserRetrieveCustomerGroupsRes, Failure>> retrieveCustomerGroups({
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
  /// Retrieves a Customer Group.
  Future<Result<UserRetrieveCustomerGroupRes, Failure>> retrieveCustomerGroup({
    /// The ID of the Customer Group.
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Retrieves a Customer Group.
  Future<Result<UserRetrieveCustomerGroupRes, Failure>> updateCustomerGroup({
    /// The ID of the Customer Group.
    required String id,
    /// Name of the customer group
    required String name,
    /// Metadata for the customer group.
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Adds a list of customers, represented by id's, to a customer group.
  Future<Result<UserAddCustomersRes, Failure>> addCustomers({
    /// The ID of the customer group.
    required String id,

    /// The ids of the customers to add
    required List<String> customerIds,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserRetrieveCustomersRes, Failure>> retrieveCustomers({
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<UserRemoveCustomersRes, Failure>> removeCustomers({
    required String id,

    required List<String> customerIds,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });

  /// Creates a CustomerGroup.
  Future<Result<UserCreateCustomerGroupRes, Failure>> createCustomerGroup({
    /// Name of the customer group
    required String name,

    /// Metadata for the customer.
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
  /// Deletes a CustomerGroup.
  Future<Result<UserDeleteCustomerGroupRes, Failure>> deleteCustomerGroup({
    /// Name of the customer group
    required String id,
    Map<String, dynamic>? customHeaders,
    Map<String, dynamic>? queryParameters,
  });
}
