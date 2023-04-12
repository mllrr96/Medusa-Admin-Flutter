class UserSalesChannelUpdateReq {
  /// Name of the sales channel.
  String? name;

  /// Sales Channel description.
  String? description;

  /// Indication of if the sales channel is active.
  bool? isDisabled;

  UserSalesChannelUpdateReq({this.name, this.description, this.isDisabled});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name;
    }
    if (description != null) {
      data['description'] = description;
    }
    if (isDisabled != null) {
      data['is_disabled'] = isDisabled;
    }

    return data;
  }
}

class UserSalesChannelCreateReq {
  /// Name of the sales channel.
  String name;

  /// Sales Channel description.
  String? description;

  /// Indication of if the sales channel is active.
  bool? isDisabled;

  UserSalesChannelCreateReq({required this.name, this.description, this.isDisabled});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    if (description != null) {
      data['description'] = description;
    }
    if (isDisabled != null) {
      data['is_disabled'] = isDisabled;
    }

    return data;
  }
}
