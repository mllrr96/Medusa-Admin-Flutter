
import 'address.dart';
import 'customer_group.dart';
import 'order.dart';

class Customer {
  String? id;
  late String email;
  String? firstName;
  String? lastName;
  String? billingAddressId;
  Address? billingAddress;
  List<Address>? shippingAddresses;
  String? phone;
  bool hasAccount = false;
  List<Order>? orders;
  List<CustomerGroup>? customerGroup;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = <String, dynamic>{};

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    billingAddressId = json['billing_address_id'];
    billingAddress = json['billing_address'] != null
        ? Address.fromJson(json['billing_address'])
        : null;
    if (json['shipping_addresses'] != null) {
      shippingAddresses = <Address>[];
      json['shipping_addresses'].forEach(
        (element) => shippingAddresses?.add(
          Address.fromJson(element),
        ),
      );
    }
    phone = json['phone'];
    hasAccount = json['has_account'] ?? false;
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((element) => orders!.add(Order.fromJson(element)));
    }
    if (json['groups'] != null) {
      customerGroup = <CustomerGroup>[];
      json['groups'].forEach(
          (element) => customerGroup!.add(CustomerGroup.fromJson(element)));
    }
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['email'] = email;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['billing_address_id'] = billingAddressId;
    json['billing_address'] = billingAddress?.toJson();
    json['shipping_addresses'] = shippingAddresses != null
        ? shippingAddresses?.map((e) => e.toJson()).toList()
        : [];
    json['phone'] = phone;
    json['has_account'] = hasAccount;
    json['orders'] =
        orders != null ? orders?.map((e) => e.toJson()).toList() : [];
    json['groups'] = customerGroup != null
        ? customerGroup?.map((e) => e.toJson()).toList()
        : [];
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}

