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

extension AuthTypeExtension on String? {
  AuthenticationType authType() {
    switch (this) {
      case 'JWT':
        return AuthenticationType.jwt;
      case 'Cookie':
        return AuthenticationType.cookie;
      case 'Api Token':
        return AuthenticationType.token;
      default:
        return AuthenticationType.jwt;
    }
  }
}
