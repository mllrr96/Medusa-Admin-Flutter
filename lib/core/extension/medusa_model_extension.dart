import 'package:medusa_admin/core/utils/enums.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

extension Name on Order {
  String? get customerName {
    final firstName = customer?.firstName;
    final lastName = customer?.lastName;
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

extension DiscountExtension on Discount {
  bool get isExpired => endsAt?.isBefore(DateTime.now()) ?? false;
}
