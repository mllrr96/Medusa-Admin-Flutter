import '../common/item.dart';

class StorePostCartReq {
  ///TODO: FeatureFlagDecorators implementation remaining

  String? regionId;
  String? countryCode;
  List<Item>? items;
  dynamic context;
  String? salesChannelId;

  StorePostCartReq({
    this.regionId,
    this.countryCode,
    this.items,
    this.context,
    this.salesChannelId,
  });

  StorePostCartReq.fromJson(Map<String, dynamic> json) {
    regionId = json['region_id'];
    countryCode = json['country_code'];
    if (json['items'] != null) {
      items = <Item>[];
      json['items'].forEach((v) {
        items!.add(Item.fromJson(v));
      });
    }
    context = json['context'];
    salesChannelId = json['sales_channel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['region_id'] = regionId;
    data['country_code'] = countryCode;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (context != null) {
      data['context'] = context!.toJson();
    }
    if (salesChannelId != null) data['sales_channel_id'] = salesChannelId;
    return data;
  }
}
