import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class UpdateGiftCardUseCase {
  final GiftCardRepository _giftCardRepository =
      getIt<MedusaAdmin>().giftCardRepository;
  static UpdateGiftCardUseCase get instance => getIt<UpdateGiftCardUseCase>();

  Future<Result<GiftCard, Failure>> createGiftCard(
      UserCreateGiftCardReq userCreateGiftCardReq) async {
    try {
      final result = await _giftCardRepository.createGiftCard(
          userCreateGiftCardReq: userCreateGiftCardReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<GiftCard, Failure>> updateGiftCard(
      {required String id,
      required UserUpdateGiftCardReq userUpdateGiftCardReq}) async {
    try {
      final result = await _giftCardRepository.updateGiftCard(
          id: id, userUpdateGiftCardReq: userUpdateGiftCardReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
