import '../../models/res/customer.dart';

abstract class BaseCustomer {
  /// Retrieves a list of Customers
  ///
  /// returns {ResponsePromise<CustomersRes?>}
  Future<CustomersRes?> retrieveCustomers({Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});


  /// Retrieves a customer
  ///
  /// returns {ResponsePromise<CustomerRes?>}
  Future<CustomerRes?> retrieve(
      {required String id, Map<String, dynamic>? customHeaders, Map<String, dynamic>? queryParameters});

}
