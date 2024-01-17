import 'package:medusa_admin_flutter/medusa_admin.dart';

extension Name on Order {
  String? get customerName {
    final firstName = billingAddress?.firstName ??
        shippingAddress?.firstName ??
        customer?.firstName;
    final lastName = billingAddress?.lastName ??
        shippingAddress?.lastName ??
        customer?.lastName;
    if (firstName == null && lastName == null) {
      return null;
    }
    return '${firstName ?? ''} ${lastName ?? ''}';
  }
}

extension UserFullName on User {
  String? get fullName {
    if (firstName == null && lastName == null) {
      return null;
    }
    return '${firstName ?? ''} ${lastName ?? ''}';
  }
}

extension CustomerName on Customer {
  String? get fullName {
    if (firstName == null && lastName == null) {
      return null;
    }
    return '${firstName ?? ''} ${lastName ?? ''}';
  }
}
