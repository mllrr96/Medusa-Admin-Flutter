import 'package:equatable/equatable.dart';

import 'index.dart';

class Store extends Equatable {
  final String id;
  final String name;
  final String defaultCurrencyCode;
  final Currency? defaultCurrency;
  final List<Currency>? currencies;
  final String? swapLinkTemplate;
  final String? paymentLinkTemplate;
  final String? inviteLinkTemplate;
  final Map<String, dynamic>? metadata;
  final String? defaultSalesChannelId;
  final SalesChannel? defaultSalesChannel;

  const Store({
    required this.id,
    required this.name,
    required this.defaultCurrencyCode,
    this.defaultCurrency,
    this.currencies,
    this.swapLinkTemplate,
    this.paymentLinkTemplate,
    this.inviteLinkTemplate,
    this.metadata,
    this.defaultSalesChannelId,
    this.defaultSalesChannel,
  });

  factory Store.fromJson(Map<String, dynamic> json) {
    List<Currency>? currencies;
    if (json['currencies'] != null) {
      currencies = [];
      json['currencies'].forEach((v) {
        currencies!.add(Currency.fromJson(v));
      });
    }
    return Store(
      id: json['id'],
      name: json['name'],
      defaultCurrencyCode: json['default_currency_code'],
      defaultCurrency: json['default_currency'] != null ? Currency.fromJson(json['default_currency']) : null,
      currencies: currencies,
      swapLinkTemplate: json['swap_link_template'],
      paymentLinkTemplate: json['payment_link_template'],
      inviteLinkTemplate: json['invite_link_template'],
      metadata: json['metadata'],
      defaultSalesChannelId: json['default_sales_channel_id'],
      defaultSalesChannel:
          json['default_sales_channel'] != null ? SalesChannel.fromJson(json['default_sales_channel']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['default_currency_code'] = defaultCurrencyCode;
    data['default_currency'] = defaultCurrency?.toJson();
    if (currencies != null) {
      data['currencies'] = currencies!.map((v) => v.toJson()).toList();
    }
    data['swap_link_template'] = swapLinkTemplate;
    data['payment_link_template'] = paymentLinkTemplate;
    data['invite_link_template'] = inviteLinkTemplate;
    data['metadata'] = metadata;
    data['default_sales_channel_id'] = defaultSalesChannelId;
    data['default_sales_channel'] = defaultSalesChannel?.toJson();
    return data;
  }

  Store copyWith({
    String? id,
    String? name,
    String? defaultCurrencyCode,
    String? swapLinkTemplate,
    String? paymentLinkTemplate,
    String? inviteLinkTemplate,
    String? defaultSalesChannelId,
    Currency? defaultCurrency,
    List<Currency>? currencies,
    Map<String, dynamic>? metadata,
    SalesChannel? defaultSalesChannel,
  }) =>
      Store(
        id: id ?? this.id,
        name: name ?? this.name,
        defaultCurrencyCode: defaultCurrencyCode ?? this.defaultCurrencyCode,
        defaultCurrency: defaultCurrency ?? this.defaultCurrency,
        currencies: currencies ?? this.currencies,
        swapLinkTemplate: swapLinkTemplate ?? this.swapLinkTemplate,
        paymentLinkTemplate: paymentLinkTemplate ?? this.paymentLinkTemplate,
        inviteLinkTemplate: inviteLinkTemplate ?? this.inviteLinkTemplate,
        metadata: metadata ?? this.metadata,
        defaultSalesChannel: defaultSalesChannel ?? this.defaultSalesChannel,
        defaultSalesChannelId: defaultSalesChannelId ?? this.defaultSalesChannelId,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        defaultCurrencyCode,
        defaultCurrency,
        currencies,
        swapLinkTemplate,
        inviteLinkTemplate,
        paymentLinkTemplate,
        metadata,
        defaultSalesChannel,
        defaultSalesChannelId
      ];
}
