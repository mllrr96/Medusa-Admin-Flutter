// Enhanced enum for common HTTP statuses you'll actually handle in app logic.
enum MedusaHttpStatus {
  badRequest(400, 'Bad Request'),
  unauthorized(401, 'Unauthorized'),
  notFound(404, 'Not Found'),
  conflict(409, 'Conflict'),
  unprocessableEntity(422, 'Unprocessable Entity'),
  internalServerError(500, 'Internal Server Error'),
  unknown(null, 'Unknown Error');

  final int? code;
  final String label;
  const MedusaHttpStatus(this.code, this.label);

  static MedusaHttpStatus fromCode(int? code) {
    if (code == null) return MedusaHttpStatus.unknown;
    return MedusaHttpStatus.values.firstWhere(
      (e) => e.code == code,
      orElse: () => MedusaHttpStatus.unknown,
    );
  }
}

class MedusaError implements Exception {
  final String? message; // human-friendly message
  final String?
      type; // e.g., not_found, invalid_data, invalid_request, invalid_state, unauthorized
  final String? code; // e.g., api_error, unknown_error
  final int? statusCode; // raw HTTP status code
  final MedusaHttpStatus status; // enum for ergonomic switching
  final List<MedusaError>? errors; // nested validation errors
  final Object? cause; // original exception (e.g., DioException)

  MedusaError({
    this.message,
    this.type,
    this.code,
    this.statusCode,
    MedusaHttpStatus? status,
    this.errors,
    this.cause,
  }) : status = status ?? MedusaHttpStatus.fromCode(statusCode);

  // ---- Factories ----

  factory MedusaError.fromJson(
    Map<String, dynamic> json, {
    int? status,
    Object? cause,
  }) {
    final err = MedusaError(
      message: _asString(json['message']),
      type: _asString(json['type']),
      code: _asString(json['code']),
      statusCode: status,
      errors: _parseErrorsList(json['errors'], status: status, cause: cause),
      cause: cause,
    );
    return err._withDefaultTypeFromStatus();
  }

  factory MedusaError.fromHttp({
    int? status,
    dynamic body,
    Object? cause,
  }) {
    // JSON object
    if (body is Map<String, dynamic>) {
      return MedusaError.fromJson(body, status: status, cause: cause);
    }
    // Array -> multiple errors
    if (body is List) {
      final nested = body.map((e) {
        if (e is Map<String, dynamic>) {
          return MedusaError.fromJson(e, status: status, cause: cause);
        }
        return MedusaError(
          message: _asString(e) ?? 'Unknown error',
          statusCode: status,
          cause: cause,
        );
      }).toList();
      return MedusaError(
        message: 'Multiple errors',
        type: _fallbackTypeForStatus(status),
        statusCode: status,
        errors: nested,
        cause: cause,
      );
    }
    // text/plain (e.g., 401 "Unauthorized")
    if (body is String) {
      return MedusaError(
        message: body.isNotEmpty ? body : _defaultMessageForStatus(status),
        type: _fallbackTypeForStatus(status),
        statusCode: status,
        cause: cause,
      );
    }
    // unknown shape
    return MedusaError(
      message: _defaultMessageForStatus(status),
      type: _fallbackTypeForStatus(status),
      statusCode: status,
      cause: cause,
    );
  }

  // ---- Serialization ----

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'type': type,
      'code': code,
      'statusCode': statusCode,
      'status': status.name,
      'errors': errors?.map((e) => e.toJson()).toList(),
    };
  }

  // ---- Convenience ----

  bool get hasDetails => (errors?.isNotEmpty ?? false);
  bool get isUnauthorized =>
      status == MedusaHttpStatus.unauthorized || type == 'unauthorized';
  bool get isNotFound =>
      status == MedusaHttpStatus.notFound || type == 'not_found';
  bool get isValidation => type == 'invalid_data' || type == 'invalid_request';
  bool get isConflict =>
      status == MedusaHttpStatus.conflict || type == 'invalid_state';

  /// Short, friendly string for SnackBars/Toasts.
  /// Keeps it human, trims noise, and surfaces nested validation details nicely.
  String toSnackBarString({int maxNested = 3}) {
    final base = message?.trim();
    if ((errors?.isNotEmpty ?? false)) {
      // Collect distinct, non-empty nested messages.
      final nestedMsgs = errors!
          .map((e) => e.message?.trim())
          .where((m) => m != null && m.isNotEmpty)
          .cast<String>()
          .toList();
      if (nestedMsgs.isNotEmpty) {
        final head = nestedMsgs.take(maxNested).join('\n• ');
        final more = nestedMsgs.length > maxNested
            ? '\n• …and ${nestedMsgs.length - maxNested} more'
            : '';
        return [
          // Show a short header based on status/type if base is generic
          if (base != null && base.isNotEmpty) base else _shortHeading(),
          '• $head$more',
        ].join('\n');
      }
    }
    return base?.isNotEmpty == true ? base! : _shortHeading();
  }

  String _shortHeading() {
    // Favor useful, compact headings for UI
    switch (status) {
      case MedusaHttpStatus.unauthorized:
        return 'Please sign in to continue.';
      case MedusaHttpStatus.notFound:
        return 'Requested resource was not found.';
      case MedusaHttpStatus.conflict:
        return 'Request conflicts with current state.';
      case MedusaHttpStatus.unprocessableEntity:
        return 'Some fields are invalid. Please review and retry.';
      case MedusaHttpStatus.badRequest:
        return 'Invalid request.';
      case MedusaHttpStatus.internalServerError:
        return 'Server error. Try again shortly.';
      case MedusaHttpStatus.unknown:
        // Fall back to type or generic label
        if (type != null && type!.isNotEmpty) {
          return _titleCase(type!.replaceAll('_', ' '));
        }
        return 'Something went wrong.';
    }
  }

  String _titleCase(String s) => s.isEmpty
      ? s
      : s
          .split(' ')
          .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
          .join(' ');

  @override
  String toString() =>
      'MedusaError(statusCode: $statusCode, status: ${status.name}, type: $type, code: $code, message: $message, errors: $errors)';

  // ---- Internals ----

  static List<MedusaError>? _parseErrorsList(dynamic v,
      {int? status, Object? cause}) {
    if (v is List) {
      return v.map((e) {
        if (e is Map<String, dynamic>) {
          return MedusaError.fromJson(e, status: status, cause: cause);
        }
        return MedusaError(
            message: _asString(e) ?? 'Unknown error',
            statusCode: status,
            cause: cause);
      }).toList();
    }
    return null;
  }

  static String? _asString(dynamic v) => v is String ? v : null;

  static String _fallbackTypeForStatus(int? status) {
    switch (status) {
      case 400:
        return 'invalid_data';
      case 401:
        return 'unauthorized';
      case 404:
        return 'not_found';
      case 409:
        return 'invalid_state';
      case 422:
        return 'invalid_request';
      case 500:
        return 'server_error';
      default:
        return 'unknown_error';
    }
  }

  static String _defaultMessageForStatus(int? status) {
    switch (status) {
      case 401:
        return 'Unauthorized';
      case 404:
        return 'Not Found';
      case 409:
        return 'Conflict';
      case 422:
        return 'Unprocessable Entity';
      case 500:
        return 'Internal Server Error';
      default:
        return 'Request failed';
    }
  }

  MedusaError _withDefaultTypeFromStatus() {
    if (type == null || type!.isEmpty) {
      return MedusaError(
        message: message,
        type: _fallbackTypeForStatus(statusCode),
        code: code,
        statusCode: statusCode,
        status: MedusaHttpStatus.fromCode(statusCode),
        errors: errors,
        cause: cause,
      );
    }
    return this;
  }
}
