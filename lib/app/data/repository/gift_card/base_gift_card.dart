import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_gift_card_req.dart';
import '../../models/res/gift_card.dart';

abstract class BaseGiftCard {
  Future<Result<UserGiftCardRes, Failure>> createGiftCard({
    required UserCreateGiftCardReq userCreateGiftCardReq,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserDeleteGiftCardRes, Failure>> deleteGiftCard({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserGiftCardsRes, Failure>> retrieveGiftCards({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserGiftCardRes, Failure>> retrieveGiftCard({
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  Future<Result<UserGiftCardRes, Failure>> updateGiftCard({
    required String id,
    required UserUpdateGiftCardReq userUpdateGiftCardReq,
    Map<String, dynamic>? customHeaders,
  });
}
