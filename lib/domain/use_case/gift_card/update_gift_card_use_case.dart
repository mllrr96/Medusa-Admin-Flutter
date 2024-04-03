import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateGiftCardUseCase {
  GiftCardRepository get _giftCardRepository =>
      getIt<MedusaAdmin>().giftCardRepository;
  static UpdateGiftCardUseCase get instance => getIt<UpdateGiftCardUseCase>();

  Future<Result<GiftCard, Failure>> createGiftCard(
      CreateGiftCardReq payload) async {
    try {
      final result = await _giftCardRepository.createGiftCard(
          userCreateGiftCardReq: payload);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<GiftCard, Failure>> updateGiftCard(
      {required String id,
      required UpdateGiftCardReq payload}) async {
    try {
      final result = await _giftCardRepository.updateGiftCard(
          id: id, userUpdateGiftCardReq: payload);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
