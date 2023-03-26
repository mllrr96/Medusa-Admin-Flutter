class UserAddLineItemReq {
  /// The ID of the variant ID to add
  final String variantId;

  /// The quantity to add
  final int quantity;

  /// An optional set of key-value pairs to hold additional information.
  final Map<String, dynamic>? metadata;

  UserAddLineItemReq({required this.quantity, required this.variantId, this.metadata});

  Map<String, dynamic> toJson() => {
        'variant_id': '',
        'quantity': '',
        if (metadata != null) 'metadata': '',
      };
}
