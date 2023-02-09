class StorePostSearchReq {
  String? q;
  int? offset;
  int? limit;
  dynamic? filter;

  StorePostSearchReq({this.q, this.offset, this.limit, this.filter});

  StorePostSearchReq.fromJson(Map<String, dynamic> json) {
    q = json['q'];
    offset = json['offset'];
    limit = json['limit'];
    filter = json['filter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['q'] = this.q;
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['filter'] = this.filter;
    return data;
  }
}
