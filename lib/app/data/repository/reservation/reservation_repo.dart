import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_reservation_req.dart';
import 'package:medusa_admin/app/data/models/res/reservation.dart';
import 'package:medusa_admin/app/data/models/store/reservation.dart';
import 'package:medusa_admin/app/data/repository/reservation/base_reservation.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../service/dio_service.dart';

class ReservationRepo extends BaseReservation {
  final _dataProvider = DioService.instance.dio;

  @override
  Future<Result<UserReservationRes, Failure>> createReservation({
    required Reservation reservation,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/reservations',
        data: reservation.toJson(),
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserReservationRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserDeleteReservationRes, Failure>> deleteReservation({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/reservations/$id',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteReservationRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserReservationRes, Failure>> retrieveReservation({
    required String id,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/reservations/$id',
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserReservationRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  @override
  Future<Result<UserReservationRes, Failure>> updateReservation({
    required String id,
    required UserUpdateReservationReq userUpdateReservationReq,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/reservations/$id',
        data: userUpdateReservationReq.toJson(),
        queryParameters: queryParams,
      );
      if (response.statusCode == 200) {
        return Success(UserReservationRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
