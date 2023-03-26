import 'package:medusa_admin/app/data/models/res/common.dart';
import 'package:medusa_admin/app/data/models/store/customer.dart';
import 'package:medusa_admin/app/data/models/store/customer_group.dart';

class UserRetrieveCustomerGroupsRes extends PaginatedResponse {
  List<CustomerGroup>? customerGroups;

  UserRetrieveCustomerGroupsRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['customer_groups'] != null) {
      customerGroups = <CustomerGroup>[];
      json['customer_groups'].forEach((v) {
        customerGroups?.add(CustomerGroup.fromJson(v));
      });
    }
  }
}

class UserAddCustomersRes {
  CustomerGroup? customerGroup;

  UserAddCustomersRes.fromJson(Map<String, dynamic> json) {
    customerGroup = CustomerGroup.fromJson(json['customer_group']);
  }
}

class UserRetrieveCustomersRes extends PaginatedResponse {
  List<Customer>? customers;

  UserRetrieveCustomersRes.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    if (json['customer_groups'] != null) {
      customers = <Customer>[];
      json['customer_groups'].forEach((v) {
        customers?.add(Customer.fromJson(v));
      });
    }
  }
}

class UserRetrieveCustomerGroupRes {
  CustomerGroup? customerGroup;

  UserRetrieveCustomerGroupRes.fromJson(Map<String, dynamic> json) {
    customerGroup = CustomerGroup.fromJson(json['customer_group']);
  }
}

class UserUpdateCustomerGroupRes {
  CustomerGroup? customerGroup;

  UserUpdateCustomerGroupRes.fromJson(Map<String, dynamic> json) {
    customerGroup = CustomerGroup.fromJson(json['customer_group']);
  }
}

class UserRemoveCustomersRes {
  CustomerGroup? customerGroup;

  UserRemoveCustomersRes.fromJson(Map<String, dynamic> json) {
    customerGroup = CustomerGroup.fromJson(json['customer_group']);
  }
}

class UserCreateCustomerGroupRes {
  CustomerGroup? customerGroup;

  UserCreateCustomerGroupRes.fromJson(Map<String, dynamic> json) {
    customerGroup = CustomerGroup.fromJson(json['customer_group']);
  }
}

class UserDeleteCustomerGroupRes {
  /// The ID of the deleted Order Edit Item Change.
  final String? id;

  /// The type of the object that was deleted.
  ///
  /// Default: "item_change"
  final String? object;

  /// Whether or not the Order Edit Item Change was deleted.
  final bool deleted;
  UserDeleteCustomerGroupRes({required this.deleted, this.id, this.object});
  factory UserDeleteCustomerGroupRes.fromJson(json) {
    return UserDeleteCustomerGroupRes(deleted: json['deleted'] ?? false, id: json['id'], object: json['object']);
  }
}
