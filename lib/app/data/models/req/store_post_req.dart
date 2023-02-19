class StorePostReq {
  StorePostReq(
      {this.name,
      this.defaultCurrencyCode,
      this.swapLinkTemplate,
      this.paymentLinkTemplate,
      this.inviteLinkTemplate,
      this.currencies,
      this.metadata});

  final String? name, defaultCurrencyCode, swapLinkTemplate, paymentLinkTemplate, inviteLinkTemplate;
  final List<String>? currencies;
  final Map<String, dynamic>? metadata;

  factory StorePostReq.fromJson(Map<String, dynamic> json) {
    return StorePostReq(
      name: json['name'],
      defaultCurrencyCode: json['default_currency_code'],
      swapLinkTemplate: json['swap_link_template'],
      paymentLinkTemplate: json['payment_link_template'],
      inviteLinkTemplate: json['invite_link_template'],
      currencies: json['currencies'] != null ? List<String>.from(json['currencies']) : null,
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['default_currency_code'] = defaultCurrencyCode;
    data['swap_link_template'] = swapLinkTemplate;
    data['payment_link_template'] = paymentLinkTemplate;
    data['invite_link_template'] = inviteLinkTemplate;
    data['currencies'] = currencies;
    data['metadata'] = metadata;
    return data;
  }
}
