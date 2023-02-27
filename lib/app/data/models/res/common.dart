class PaginatedResponse {
  int? limit;
  int? offset;
  int? count;

  PaginatedResponse.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['limit'] = limit;
    data['offset'] = offset;
    data['count'] = count;
    return data;
  }
}
