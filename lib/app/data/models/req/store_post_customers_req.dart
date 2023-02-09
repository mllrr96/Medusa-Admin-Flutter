class StorePostCustomersReq {
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  String? phone;

  StorePostCustomersReq({
    this.email,
    this.firstName,
    this.lastName,
    this.password,
    this.phone,
  });

  StorePostCustomersReq.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    password = json['password'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['password'] = this.password;
    data['phone'] = this.phone;
    return data;
  }
}
