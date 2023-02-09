class Currency {
  String? code;
  String? symbol;
  String? symbolNative;
  String? name;
  bool? includeTax;

  Currency({
    this.code,
    this.symbol,
    this.symbolNative,
    this.name,
    this.includeTax,
  });

  Currency.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
    symbolNative = json['symbol_native'];
    name = json['name'];
    includeTax = json['include_tax'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['code'] = code;
    json['symbol'] = symbol;
    json['symbolNative'] = symbolNative;
    json['name'] = name;
    json['include_tax'] = includeTax;
    return json;
  }
}
