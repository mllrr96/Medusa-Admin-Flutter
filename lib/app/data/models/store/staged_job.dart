class StagedJob {
  String? id;
  String? eventName;
  Map<String, dynamic> data = {};

  StagedJob({
    this.id,
    required this.eventName,
    this.data = const {},
  });

  StagedJob.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventName = json['event_name'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['event_name'] = eventName;
    json['data'] = data;
    return json;
  }
}
