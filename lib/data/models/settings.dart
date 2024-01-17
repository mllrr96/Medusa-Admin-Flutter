import 'package:flex_color_scheme/flex_color_scheme.dart';

import '../../../core/utils/enums.dart';

class AppSettings {
  final bool useAndroidPicker;
  final bool useMaterial3;
  final bool? useBiometric;
  final DateFormatOptions dateFormatOptions;
  final TimeFormatOptions timeFormatOptions;
  final FlexScheme colorScheme;

  AppSettings({
    required this.useAndroidPicker,
    required this.useMaterial3,
    required this.useBiometric,
    required this.dateFormatOptions,
    required this.timeFormatOptions,
    required this.colorScheme,
  });
  AppSettings.defaultSettings({
    this.useAndroidPicker = false,
    this.useMaterial3 = true,
    this.useBiometric,
    this.dateFormatOptions = DateFormatOptions.fifth,
    this.timeFormatOptions = TimeFormatOptions.amPm,
    this.colorScheme = FlexScheme.indigo,
  });

  AppSettings copyWith({
    bool? useAndroidPicker,
    bool? useMaterial3,
    bool? useBiometric,
    bool resetBiometric = false,
    DateFormatOptions? dateFormatOptions,
    TimeFormatOptions? timeFormatOptions,
    FlexScheme? colorScheme,
  }) =>
      AppSettings(
        useAndroidPicker: useAndroidPicker ?? this.useAndroidPicker,
        useMaterial3: useMaterial3 ?? this.useMaterial3,
        useBiometric: resetBiometric ? null : useBiometric ?? this.useBiometric,
        timeFormatOptions: timeFormatOptions ?? this.timeFormatOptions,
        dateFormatOptions: dateFormatOptions ?? this.dateFormatOptions,
        colorScheme: colorScheme ?? this.colorScheme,
      );

  Map<String, dynamic> toJson() => {
        'useAndroidPicker': useAndroidPicker,
        'useMaterial3': useMaterial3,
        'useBiometric': useBiometric,
        'timeFormatOptions': timeFormatOptions.index,
        'dateFormatOptions': dateFormatOptions.index,
        'colorScheme': colorScheme.name,
      };

  factory AppSettings.fromJson(Map<String, dynamic>? json) {
    return AppSettings(
        useAndroidPicker: json?['useAndroidPicker'] ?? false,
        useMaterial3: json?['useMaterial3'] ?? true,
        useBiometric: json?['useBiometric'],
        timeFormatOptions:
            TimeFormatOptions.fromInt(json?['timeFormatOptions']),
        dateFormatOptions:
            DateFormatOptions.fromInt(json?['dateFormatOptions']),
        colorScheme: FlexScheme.values.firstWhere(
            (e) => e.name == json?['colorScheme'],
            orElse: () => FlexScheme.hippieBlue));
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
