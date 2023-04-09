class FulfillmentOption {
  /// ID of the fulfillment provider
  final String? providerId;

  // TODO: check this field
  // final FulfillmentOptions? options;
  FulfillmentOption({this.providerId});

  factory FulfillmentOption.fromJson(Map<String, dynamic> json) {
    return FulfillmentOption(providerId: json['provider_id']);
  }
}