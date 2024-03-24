import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class GiftCardsUseCase {
  GiftCardRepository get _giftCardRepository =>
      getIt<MedusaAdmin>().giftCardRepository;
  static GiftCardsUseCase get instance => getIt<GiftCardsUseCase>();

  Future<Result<UserGiftCardsRes, Failure>> fetchGiftCards({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _giftCardRepository.retrieveGiftCards(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<GiftCard, Failure>> fetchGiftCard(String id) async {
    try {
      final result = await _giftCardRepository.retrieveGiftCard(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<UserDeleteGiftCardRes, Failure>> delete(String id) async {
    try {
      final result = await _giftCardRepository.deleteGiftCard(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<GiftCard, Failure>> create(
      UserCreateGiftCardReq userCreateGiftCardReq) async {
    try {
      final result = await _giftCardRepository.createGiftCard(
          userCreateGiftCardReq: userCreateGiftCardReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<GiftCard, Failure>> update({
    required String id,
    required UserUpdateGiftCardReq userUpdateGiftCardReq,
  }) async {
    try {
      final result = await _giftCardRepository.updateGiftCard(
          id: id, userUpdateGiftCardReq: userUpdateGiftCardReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
