class OrderPreference {
  final bool hideFlag;
  final bool paymentStatusDot;
  final bool alternativeCard;
  final bool includeEmail;
  final double padding;
  OrderPreference({
    required this.hideFlag,
    required this.paymentStatusDot,
    required this.includeEmail,
    required this.alternativeCard,
    required this.padding,
  });
  OrderPreference.defaultSettings(
      {this.hideFlag = false,
        this.paymentStatusDot = true,
        this.includeEmail = false,
        this.alternativeCard = true,
        this.padding = 8.0});

  factory OrderPreference.fromJson(Map<String, dynamic>? json) {
    return OrderPreference(
      hideFlag: json?['hideFlag'] ?? false,
      paymentStatusDot: json?['paymentStatusDot'] ?? true,
      includeEmail: json?['includeEmail'] ?? false,
      alternativeCard: json?['alternativeCard'] ?? true,
      padding: json?['padding'] ?? 8.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hideFlag': hideFlag,
      'paymentStatusDot': paymentStatusDot,
      'includeEmail': includeEmail,
      'alternativeCard': alternativeCard,
      'padding': padding,
    };
  }

  OrderPreference copyWith({
    bool? hideFlag,
    bool? paymentStatusDot,
    bool? includeEmail,
    bool? alternativeCard,
    double? padding,
  }) {
    return OrderPreference(
      hideFlag: hideFlag ?? this.hideFlag,
      paymentStatusDot: paymentStatusDot ?? this.paymentStatusDot,
      includeEmail: includeEmail ?? this.includeEmail,
      alternativeCard: alternativeCard ?? this.alternativeCard,
      padding: padding ?? this.padding,
    );
  }
}
