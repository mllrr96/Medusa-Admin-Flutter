import '../store/customer.dart';
import 'common.dart';

class CustomersRes extends PaginatedResponse {
  List<Customer>? customers;

  CustomersRes.fromJson(json) : super.fromJson(json) {
    if (json['customers'] != null) {
      customers = <Customer>[];
      json['customers'].forEach((v) {
        customers?.add(Customer.fromJson(v));
      });
    }
  }
}

class CustomerRes {
  Customer? customer;

  CustomerRes.fromJson(json) {
    if (json['customer'] != null) {
      customer = Customer.fromJson(json['customer']);
    }
  }
}
