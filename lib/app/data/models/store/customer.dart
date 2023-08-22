import 'address.dart';
import 'customer_group.dart';
import 'order.dart';

class Customer {
  Customer(
      {required this.email,
      this.id,
      this.firstName,
      this.lastName,
      this.billingAddressId,
      this.billingAddress,
      this.shippingAddresses,
      this.phone,
      this.hasAccount = false,
      this.orders,
      this.customerGroup,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.metadata});
  String? id;
  String email;
  String? firstName;
  String? lastName;
  String? billingAddressId;
  Address? billingAddress;
  List<Address>? shippingAddresses;
  String? phone;
  bool hasAccount;
  List<Order>? orders;
  List<CustomerGroup>? customerGroup;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic>? metadata;

  factory Customer.fromJson(Map<String, dynamic> json) {
    Address? billingAddress;
    List<Address>? shippingAddresses;
    List<Order>? orders;
    List<CustomerGroup>? customerGroup;

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

    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((element) => orders!.add(Order.fromJson(element)));
    }
    if (json['groups'] != null) {
      customerGroup = <CustomerGroup>[];
      json['groups'].forEach(
          (element) => customerGroup!.add(CustomerGroup.fromJson(element)));
    }
    return Customer(
      id: json['id'],
      email: json['email'],
      hasAccount: json['has_account'] ?? false,
      phone: json['phone'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      billingAddressId: json['billing_address_id'],
      createdAt: DateTime.tryParse(json['created_at'] ?? ''),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? ''),
      deletedAt: DateTime.tryParse(json['deleted_at'] ?? ''),
      billingAddress: billingAddress,
      shippingAddresses: shippingAddresses,
      orders: orders,
      customerGroup: customerGroup,
      metadata: json['metadata'],
    );
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
