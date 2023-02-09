class ReturnItem {
  String? itemId;
  int? quantity;
  String? reasonId;
  String? note;

  ReturnItem({this.itemId, this.quantity, this.reasonId, this.note});

  ReturnItem.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    quantity = json['quantity'];
    reasonId = json['reason_id'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['quantity'] = this.quantity;
    data['reason_id'] = this.reasonId;
    data['note'] = this.note;
    return data;
  }
}
