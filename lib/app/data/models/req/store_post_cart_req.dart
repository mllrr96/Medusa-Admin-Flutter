import 'package:medusa_admin/app/data/models/store/index.dart';

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
        items!.add(new Item.fromJson(v));
      });
    }
    context = json['context'] != null ? json['context'] : null;
    salesChannelId = json['sales_channel_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region_id'] = this.regionId;
    data['country_code'] = this.countryCode;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.context != null) {
      data['context'] = this.context!.toJson();
    }
    if (salesChannelId != null) data['sales_channel_id'] = salesChannelId;
    return data;
  }
}
