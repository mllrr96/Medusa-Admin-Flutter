class UserUpdateCustomerReq {
  /// The Customer's email.
  final String? email;

  /// The Customer's first name.
  final String? firstName;

  /// The Customer's last name.
  final String? lastName;

  /// The Customer's phone number.
  final String? phone;

  /// The Customer's password.
  final String? password;

  /// A list of customer groups to which the customer belongs.
  final List<String>? groupIds;

  /// An optional set of key-value pairs to hold additional information.
  final Map<String, dynamic>? metadata;

  UserUpdateCustomerReq(
      {this.email, this.firstName, this.lastName, this.phone, this.password, this.groupIds, this.metadata});

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    if (email != null) {
      json['email'] = email;
    }
    if (firstName != null) {
      json['first_name'] = firstName;
    }
    if (lastName != null) {
      json['last_name'] = lastName;
    }
    if (phone != null) {
      json['phone'] = phone;
    }
    if (password != null) {
      json['password'] = password;
    }
    if (groupIds != null) {
      json['groups'] = groupIds;
    }
    if (metadata != null) {
      json['metadata'] = metadata;
    }

    return json;
  }
}

class UserCreateCustomerReq {
  /// The Customer's email.
  final String email;

  /// The Customer's first name.
  final String firstName;

  /// The Customer's last name.
  final String lastName;

  /// The Customer's phone number.
  final String? phone;

  /// The Customer's password.
  final String password;

  /// A list of customer groups to which the customer belongs.
  final List<String>? groupIds;

  /// An optional set of key-value pairs to hold additional information.
  final Map<String, dynamic>? metadata;

  UserCreateCustomerReq(
      {required this.email,
      required this.firstName,
      required this.lastName,
      this.phone,
      required this.password,
      this.groupIds,
      this.metadata});

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};

    json['email'] = email;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['password'] = password;

    if (phone != null) {
      json['phone'] = phone;
    }

    if (groupIds != null) {
      json['groups'] = groupIds;
    }
    if (metadata != null) {
      json['metadata'] = metadata;
    }

    return json;
  }
}
