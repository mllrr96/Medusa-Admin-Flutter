import 'dart:developer';

import 'package:medusa_admin/app/data/datasource/remote/exception/api_error_handler.dart';
import 'package:medusa_admin/app/data/models/req/user_gift_card_req.dart';
import 'package:medusa_admin/app/data/models/res/gift_card.dart';
import 'package:medusa_admin/app/data/repository/gift_card/base_gift_card.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:dio/dio.dart';
import '../../datasource/remote/dio/dio_client.dart';
class GiftCardRepo extends BaseGiftCard {
  final _dataProvider = DioClient(dio: Dio());

  /// Creates a Gift Card that can redeemed by its unique code. The Gift Card is only valid within 1 region.
  @override
  Future<Result<UserGiftCardRes, Failure>> createGiftCard({
    required UserCreateGiftCardReq userCreateGiftCardReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/gift-cards',
        data: userCreateGiftCardReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserGiftCardRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Deletes a Gift Card
  @override
  Future<Result<UserDeleteGiftCardRes, Failure>> deleteGiftCard({
    /// The ID of the Gift Card to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.delete(
        '/gift-cards/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserDeleteGiftCardRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a Gift Card.
  @override
  Future<Result<UserGiftCardRes, Failure>> retrieveGiftCard({
    /// The ID of the Gift Card.
    required String id,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/gift-cards/$id',
      );
      if (response.statusCode == 200) {
        return Success(UserGiftCardRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Retrieves a list of Gift Cards.
  @override
  Future<Result<UserGiftCardsRes, Failure>> retrieveGiftCards({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.get(
        uri: '/gift-cards',
      );
      if (response.statusCode == 200) {
        return Success(UserGiftCardsRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }

  /// Update a Gift Card that can redeemed by its unique code. The Gift Card is only valid within 1 region.
  @override
  Future<Result<UserGiftCardRes, Failure>> updateGiftCard({
    /// The ID of the Gift Card.
    required String id,
    required UserUpdateGiftCardReq userUpdateGiftCardReq,
    Map<String, dynamic>? customHeaders,
  }) async {
    try {
      if (customHeaders != null) {
        _dataProvider.dio.options.headers.addAll(customHeaders);
      }
      final response = await _dataProvider.post(
        uri: '/gift-cards/$id',
        data: userUpdateGiftCardReq.toJson(),
      );
      if (response.statusCode == 200) {
        return Success(UserGiftCardRes.fromJson(response.data));
      } else {
        return Error(Failure.from(response));
      }
    } catch (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
      return Error(Failure.from(error));
    }
  }
}
