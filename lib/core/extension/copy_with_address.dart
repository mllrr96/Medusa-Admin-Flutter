import 'package:medusa_admin_dart_client/medusa_admin.dart';

extension CopyWithAddress on Address {
  Address copyWith({
    String? id,
    String? customerId,
    Customer? customer,
    String? firstName,
    String? lastName,
    String? company,
    String? address1,
    String? address2,
    String? city,
    String? province,
    Country? country,
    String? phone,
    String? countryCode,
    String? postalCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    Map<String, dynamic>? metadata,
  }) {
    return Address(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      customer: customer ?? this.customer,
      deletedAt: deletedAt ?? this.deletedAt,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      company: company ?? this.company,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      city: city ?? this.city,
      postalCode: postalCode ?? this.postalCode,
      province: province ?? this.province,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      metadata: metadata ?? this.metadata,
    );
  }
}
