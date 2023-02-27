class UserSalesChannelUpdateReq {
  /// Name of the sales channel.
  String? name;

  /// Sales Channel description.
  String? description;

  /// Indication of if the sales channel is active.
  bool? isDisabled;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['is_disabled'] = isDisabled;

    return data;
  }
}
