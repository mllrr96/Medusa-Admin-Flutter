class StorePostCustomersCustomerReq {
  String? billingAddress;
  String? email;
  String? firstName;
  String? lastName;
  Map<String, dynamic>? metadata;
  String? password;
  String? phone;

  StorePostCustomersCustomerReq({
    this.billingAddress,
    this.email,
    this.firstName,
    this.lastName,
    this.metadata,
    this.password,
    this.phone,
  });

  StorePostCustomersCustomerReq.fromJson(Map<String, dynamic> json) {
    billingAddress = json['billing_address'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    metadata = json['metadata'];
    password = json['password'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['billing_address'] = this.billingAddress;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.metadata != null) {
      data['metadata'] = this.metadata;
    }
    data['password'] = this.password;
    data['phone'] = this.phone;
    return data;
  }
}
