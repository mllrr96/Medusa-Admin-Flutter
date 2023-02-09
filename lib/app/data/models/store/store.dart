import 'index.dart';


class Store {
  String? id;
  String? name;
  String? defaultCurrencyCode;
  Currency? defaultCurrency;
  List<Currency>? currencies;
  String? swapLinkTemplate;
  String? paymentLinkTemplate;
  String? inviteLinkTemplate;
  Map<String, dynamic>? metadata;
  String? defaultSalesChannelId;
  SalesChannel? defaultSalesChannel;

  Store({
    this.id,
    this.name,
    this.defaultCurrencyCode,
    this.defaultCurrency,
    this.currencies,
    this.swapLinkTemplate,
    this.paymentLinkTemplate,
    this.inviteLinkTemplate,
    this.metadata,
    this.defaultSalesChannelId,
    this.defaultSalesChannel,
  });

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    defaultCurrencyCode = json['default_currency_code'];
    defaultCurrency = json['default_currency'] != null
        ? Currency.fromJson(json['default_currency'])
        : null;
    if (json['currencies'] != null) {
      currencies = <Currency>[];
      json['currencies'].forEach((v) {
        currencies!.add(new Currency.fromJson(v));
      });
    }
    swapLinkTemplate = json['swap_link_template'];
    paymentLinkTemplate = json['payment_link_template'];
    inviteLinkTemplate = json['invite_link_template'];
    metadata = json['metadata'];
    defaultSalesChannelId = json['default_sales_channel_id'];
    defaultSalesChannel = json['default_sales_channel'] != null
        ? SalesChannel.fromJson(json['default_sales_channel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['default_currency_code'] = this.defaultCurrencyCode;
    data['default_currency'] = this.defaultCurrency?.toJson() ?? {};
    if (this.currencies != null) {
      data['currencies'] = this.currencies!.map((v) => v.toJson()).toList();
    }
    data['swap_link_template'] = this.swapLinkTemplate;
    data['payment_link_template'] = this.paymentLinkTemplate;
    data['invite_link_template'] = this.inviteLinkTemplate;
    data['metadata'] = this.metadata;
    data['default_sales_channel_id'] = this.defaultSalesChannelId;
    data['default_sales_channel'] = this.defaultSalesChannel?.toJson() ?? {};
    return data;
  }
}
