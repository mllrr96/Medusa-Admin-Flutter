import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class GiftCardsUseCase {
  final GiftCardRepository _giftCardRepository =
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
