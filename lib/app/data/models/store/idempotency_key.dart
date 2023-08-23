class IdempotencyKey {
  String? id;
  String? idempotencyKey;
  DateTime? createdAt;
  DateTime? lockedAt;
  String? requestMethod;
  dynamic requestParams;
  String? requestPath;
  String? responseCode;
  dynamic responseBody;
  String recoveryPoint = 'started';

  IdempotencyKey({
    this.id,
    required this.idempotencyKey,
    this.createdAt,
    this.lockedAt,
    this.requestMethod,
    this.requestParams,
    this.requestPath,
    this.responseCode,
    this.responseBody,
    this.recoveryPoint = 'started',
  });

  IdempotencyKey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idempotencyKey = json['idempotency_key'];
    createdAt = DateTime.tryParse(json['created_at'] ?? '')?.toLocal();
    lockedAt = DateTime.tryParse(json['locked_at'] ?? '')?.toLocal();
    requestMethod = json['request_method'];
    requestParams = json['request_params'];
    requestPath = json['request_path'];
    responseCode = json['response_code'];
    responseBody = json['response_body'];
    recoveryPoint = json['recovery_point'];
  }

  Map<String, dynamic> toJson() {
    var json = <String, dynamic>{};
    json['id'] = id;
    json['idempotency_key'] = idempotencyKey;
    json['created_at'] = createdAt.toString();
    json['locked_at'] = lockedAt.toString();
    json['request_method'] = requestMethod;
    json['request_params'] = requestParams;
    json['request_path'] = requestPath;
    json['response_code'] = responseCode;
    json['response_body'] = responseBody;
    json['recovery_point'] = recoveryPoint;
    return json;
  }
}
