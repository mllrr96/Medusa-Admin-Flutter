class ReturnShipping {
  String? optionId;
  int? price;

  ReturnShipping({this.optionId, this.price});

  ReturnShipping.fromJson(Map<String, dynamic> json) {
    optionId = json['option_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['option_id'] = optionId;
    json['price'] = price;
    return json;
  }
}
