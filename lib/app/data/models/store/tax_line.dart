class TaxLine {
  String? id;
  int? rate;
  String? code;
  String? name;
  Map<String, dynamic>? metadata;

  TaxLine({
    this.id,
    this.rate,
    this.code,
    this.name,
    this.metadata,
  });

  TaxLine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rate = json['rate'];
    code = json['code'];
    name = json['name'];
    metadata = json['metadata'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rate'] = this.rate;
    data['code'] = this.code;
    data['name'] = this.name;
    data['metadata'] = this.metadata;
    return data;
  }
}
