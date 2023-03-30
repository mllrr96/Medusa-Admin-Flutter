import 'package:multiple_result/multiple_result.dart';
import '../../datasource/remote/exception/api_error_handler.dart';
import '../../models/req/user_gift_card_req.dart';
import '../../models/res/gift_card.dart';

abstract class BaseGiftCard {
  /// Creates a Gift Card that can redeemed by its unique code. The Gift Card is only valid within 1 region.
  Future<Result<UserGiftCardRes, Failure>> createGiftCard({
    required UserCreateGiftCardReq userCreateGiftCardReq,
    Map<String, dynamic>? customHeaders,
  });

  /// Deletes a Gift Card
  Future<Result<UserDeleteGiftCardRes, Failure>> deleteGiftCard({
    /// The ID of the Gift Card to delete.
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a list of Gift Cards.
  Future<Result<UserGiftCardsRes, Failure>> retrieveGiftCards({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a Gift Card.
  Future<Result<UserGiftCardRes, Failure>> retrieveGiftCard({
    /// The ID of the Gift Card.
    required String id,
    Map<String, dynamic>? customHeaders,
  });

  /// Retrieves a Gift Card.
  Future<Result<UserGiftCardRes, Failure>> updateGiftCard({
    /// The ID of the Gift Card.
    required String id,
    required UserUpdateGiftCardReq userUpdateGiftCardReq,
    Map<String, dynamic>? customHeaders,
  });
}
