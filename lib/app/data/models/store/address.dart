
import 'country.dart';
import 'customer.dart';

class Address {
  String? id;
  String? customerId;
  List<Customer>? customer;
  String? company;
  String? firstName;
  String? lastName;
  String? address1;
  String? address2;
  String? city;
  Country? country;
  String? countryCode;
  String? province;
  String? postalCode;
  int? phone;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;
  Map<String, dynamic> metadata = {};

  Address({
    this.id,
    this.customerId,
    this.customer,
    this.company,
    this.firstName,
    this.lastName,
    this.address1,
    this.address2,
    this.city,
    this.country,
    this.countryCode,
    this.province,
    this.postalCode,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.metadata = const {},
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    if (json['customer'] != null) {
      customer = <Customer>[];
      json['customer'].forEach(
        (element) => customer!.add(
          Customer.fromJson(element),
        ),
      );
    }
    company = json['company'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    countryCode = json['country_code'];
    province = json['province'];
    postalCode = json['postal_code'];
    phone = json['phone'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'] ?? {};
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['customer_id'] = customerId;
    json['customer'] =
        customer != null ? customer?.map((e) => e.toJson()).toList() : [];
    json['company'] = company;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['address_1'] = address1;
    json['address_2'] = address2;
    json['city'] = city;
    json['country_code'] = countryCode;
    json['country'] = country?.toJson() ?? {};
    json['province'] = province;
    json['postal_code'] = postalCode;
    json['phone'] = phone;
    json['created_at'] = createdAt.toString();
    json['updated_at'] = updatedAt.toString();
    json['deleted_at'] = deletedAt.toString();
    json['metadata'] = metadata;
    return json;
  }
}
