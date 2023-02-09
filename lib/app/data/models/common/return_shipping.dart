class ReturnShipping {
  String? optionId;

  ReturnShipping({this.optionId});

  ReturnShipping.fromJson(Map<String, dynamic> json) {
    optionId = json['option_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['option_id'] = this.optionId;
    return data;
  }
}
