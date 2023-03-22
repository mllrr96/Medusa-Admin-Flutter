import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart' show debugPrint;

class Failure {
  final dynamic error;
  Failure({required this.error});

  dynamic getMessage() {
    dynamic errorDescription = "Something went Wrong.";
    debugPrint(error.toString());
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorDescription = "Request to API server was cancelled";
              break;
            case DioErrorType.connectionTimeout:
              errorDescription = "Connection timeout with API server";
              break;
            case DioErrorType.unknown:
              errorDescription = "Connection to API server failed due to internet connection";
              break;
            case DioErrorType.receiveTimeout:
              errorDescription = "Receive timeout in connection with API server";
              break;
            case DioErrorType.badResponse:
              switch (error.response?.statusCode) {
                case 404:
                case 500:
                case 503:
                  errorDescription = error.response?.statusMessage;
                  break;
                case 401:
                  errorDescription = error.response?.statusMessage;
                  break;
                case 422:
                  errorDescription = error.response?.statusMessage;
                  break;
                default:
                  "Unexpected error occurred";
              }
              break;
            case DioErrorType.sendTimeout:
              errorDescription = "Send timeout with server";
              break;
          }
        } else {
          errorDescription = "Unexpected error occurred";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = errorDescription;
    }
    return errorDescription;
  }
}

class AltFailure {
  final int? code;
  final String message;
  final String type;
  AltFailure({this.code, required this.message, required this.type});

  factory AltFailure.fromResponse(dynamic error) {
    var failure = AltFailure(message: '', type: '');
    try {
      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.cancel:
            failure = failure.copyWith(message: 'Request to API server was cancelled');
            break;
          case DioErrorType.connectionTimeout:
            failure = failure.copyWith(message: 'Connection timeout with API server');

            break;
          case DioErrorType.unknown:
            failure = failure.copyWith(message: 'Connection to API server failed due to internet connection');

            break;
          case DioErrorType.receiveTimeout:
            failure = failure.copyWith(message: 'Receive timeout in connection with API server');
            break;
          case DioErrorType.badResponse:
            switch (error.response?.statusCode) {
              case 401:
                failure = failure.copyWith(code: 401, message: 'Unauthorized');
                break;
              case 400:
              case 404:
              case 500:
              case 503:
              case 422:
                final errorResponse = error.response?.data as Map;
                failure = failure.copyWith(
                    code: error.response?.statusCode,
                    message: errorResponse['message'] ?? '',
                    type: errorResponse['type'] ?? '');

                break;
              default:
                "Unexpected error occurred";
            }
            break;
          case DioErrorType.sendTimeout:
            failure = failure.copyWith(message: 'Send timeout with server');

            break;
          case DioErrorType.badCertificate:
            failure = failure.copyWith(message: 'Bad certificate');
            break;
          case DioErrorType.connectionError:
            failure = failure.copyWith(message: 'Connection error');

            break;
        }
      } else {
        failure = failure.copyWith(message: 'Unexpected error occurred');
      }
    } on FormatException catch (e) {
      failure = failure.copyWith(message: e.toString());
    }

    return failure;
  }

  AltFailure copyWith({
    int? code,
    String? message,
    String? type,
  }) =>
      AltFailure(code: code ?? this.code, message: message ?? this.message, type: type ?? this.type);
}
