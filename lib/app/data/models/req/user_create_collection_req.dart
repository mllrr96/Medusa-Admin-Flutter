class UserCreateCollectionReq {
  UserCreateCollectionReq({required this.title, this.handle, this.metadata});

  String title;
  String? handle;
  Map<String, dynamic>? metadata;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (handle != null) {
      data['handle'] = handle;
    }

    if (metadata != null) {
      data['metadata'] = metadata;
    }
    return data;
  }
}
