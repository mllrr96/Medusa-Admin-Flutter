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
  Map<String, dynamic>? metadata;

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
    this.metadata,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    if (json['customer'] != null) {
      customer = <Customer>[];
      json['customer'].forEach(
        (element) => customer!.add(Customer.fromJson(element)),
      );
    }
    company = json['company'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
    countryCode = json['country_code'];
    province = json['province'];
    postalCode = json['postal_code'];
    phone = int.tryParse(json['phone'] ?? '');
    createdAt = DateTime.tryParse(json['created_at'] ?? '');
    updatedAt = DateTime.tryParse(json['updated_at'] ?? '');
    deletedAt = DateTime.tryParse(json['deleted_at'] ?? '');
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (id != null) {
      json['id'] = id;
    }

    if (customerId != null) {
      json['customer_id'] = customerId;
    }

    if (customer != null) {
      json['customer'] = customer?.map((e) => e.toJson()).toList();
    }

    if (company != null) {
      json['company'] = company;
    }

    if (firstName != null) {
      json['first_name'] = firstName;
    }

    if (lastName != null) {
      json['last_name'] = lastName;
    }

    if (address1 != null) {
      json['address_1'] = address1;
    }

    if (address2 != null) {
      json['address_2'] = address2;
    }

    if (city != null) {
      json['city'] = city;
    }

    if (countryCode != null) {
      json['country_code'] = countryCode;
    }

    if (country != null) {
      json['country'] = country?.toJson();
    }

    if (province != null) {
      json['province'] = province;
    }

    if (postalCode != null) {
      json['postal_code'] = postalCode;
    }

    if (phone != null) {
      json['phone'] = phone;
    }

    if (createdAt != null) {
      json['created_at'] = createdAt.toString();
    }
    if (updatedAt != null) {
      json['updated_at'] = updatedAt.toString();
    }

    if (deletedAt != null) {
      json['deleted_at'] = deletedAt.toString();
    }

    if (metadata != null) {
      json['metadata'] = metadata;
    }

    return json;
  }
}
