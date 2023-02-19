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

  /// Array of currencies in 3 character ISO code format.
  final List<String>? currencies;
  /// An optional set of key-value pairs with additional information.
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
    if (name != null) {
      data['name'] = name;
    }
    if (defaultCurrencyCode != null) {
      data['default_currency_code'] = defaultCurrencyCode;
    }
    if (swapLinkTemplate != null) {
      data['swap_link_template'] = swapLinkTemplate;
    }
    if (paymentLinkTemplate != null) {
      data['payment_link_template'] = paymentLinkTemplate;
    }
    if (inviteLinkTemplate != null) {
      data['invite_link_template'] = inviteLinkTemplate;
    }
    if (currencies != null) {
      data['currencies'] = currencies;
    }
    if (metadata != null) {
      data['metadata'] = metadata;
    }

    return data;
  }
}
