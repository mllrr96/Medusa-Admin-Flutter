import '../../../../core/utils/enums.dart';

class AppSettings {
  final bool useAndroidPicker;
  final DateFormatOptions dateFormatOptions;
  final TimeFormatOptions timeFormatOptions;

  AppSettings({
    this.useAndroidPicker = false,
    this.dateFormatOptions = DateFormatOptions.fifth,
    this.timeFormatOptions = TimeFormatOptions.amPm,
  });

  AppSettings copyWith({
    bool? useAndroidPicker,
    DateFormatOptions? dateFormatOptions,
    TimeFormatOptions? timeFormatOptions,
  }) =>
      AppSettings(
        useAndroidPicker: useAndroidPicker ?? this.useAndroidPicker,
        timeFormatOptions: timeFormatOptions ?? this.timeFormatOptions,
        dateFormatOptions: dateFormatOptions ?? this.dateFormatOptions,
      );

  Map<String, dynamic> toJson() => {
        'useAndroidPicker': useAndroidPicker,
        'timeFormatOptions': timeFormatOptions.index,
        'dateFormatOptions': dateFormatOptions.index,
      };

  factory AppSettings.fromJson(Map<String, dynamic>? json) {
    return AppSettings(
        useAndroidPicker: json?['useAndroidPicker'] ?? false,
        timeFormatOptions: TimeFormatOptions.fromInt(json?['timeFormatOptions']),
        dateFormatOptions: DateFormatOptions.fromInt(json?['dateFormatOptions']));
  }
}

class OrderSettings {
  final bool hideFlag;
  final bool paymentStatusDot;
  final bool alternativeCard;
  final bool includeEmail;
  final double padding;
  OrderSettings({
    required this.hideFlag,
    required this.paymentStatusDot,
    required this.includeEmail,
    required this.alternativeCard,
    required this.padding,
  });
  OrderSettings.defaultSettings(
      {this.hideFlag = false,
      this.paymentStatusDot = true,
      this.includeEmail = false,
      this.alternativeCard = true,
      this.padding = 8.0});

  factory OrderSettings.fromJson(Map<String, dynamic>? json) {
    return OrderSettings(
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

  OrderSettings copyWith({
    bool? hideFlag,
    bool? paymentStatusDot,
    bool? includeEmail,
    bool? alternativeCard,
    double? padding,
  }) {
    return OrderSettings(
      hideFlag: hideFlag ?? this.hideFlag,
      paymentStatusDot: paymentStatusDot ?? this.paymentStatusDot,
      includeEmail: includeEmail ?? this.includeEmail,
      alternativeCard: alternativeCard ?? this.alternativeCard,
      padding: padding ?? this.padding,
    );
  }
}
