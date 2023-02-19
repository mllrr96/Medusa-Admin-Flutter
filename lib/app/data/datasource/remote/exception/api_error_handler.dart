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
