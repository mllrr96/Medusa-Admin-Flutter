import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class GiftCardsUseCase {
  GiftCardsRepository get _giftCardRepository => _medusaAdminV2.giftCards;

  static GiftCardsUseCase get instance => getIt<GiftCardsUseCase>();
  final MedusaAdminV2 _medusaAdminV2;

  GiftCardsUseCase(this._medusaAdminV2);

  Future<Result<GiftCardsListResponse, MedusaError>> fetchGiftCards({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _giftCardRepository.retrieveAll(queryParameters ?? {});
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<GiftCard, MedusaError>> fetchGiftCard(String id) async {
    try {
      final result = await _giftCardRepository.retrieve(id);
      return Success(result.giftCard);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<Unit, MedusaError>> delete(String id) async {
    try {
      await _giftCardRepository.delete(id);
      return Success(unit);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<GiftCard, MedusaError>> create(
      CreateGiftCardRequest payload) async {
    try {
      final result = await _giftCardRepository.create(payload);
      return Success(result.giftCard);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<GiftCard, MedusaError>> update({
    required String id,
    required UpdateGiftCardRequest payload,
  }) async {
    try {
      final result = await _giftCardRepository.update(id, payload);
      return Success(result.giftCard);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(MedusaError(
          code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
