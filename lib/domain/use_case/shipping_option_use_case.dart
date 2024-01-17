import 'package:injectable/injectable.dart';
import 'package:medusa_admin/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ShippingOptionUseCase {
  final ShippingOptionsRepository _shippingOptionsRepository =
      getIt<MedusaAdmin>().shippingOptionsRepository;
  static ShippingOptionUseCase get instance => getIt<ShippingOptionUseCase>();

  Future<Result<UserRetrieveAllShippingOptionRes, Failure>> call(
      {Map<String, dynamic>? queryParams}) async {
    try {
      final result = await _shippingOptionsRepository.retrieveAll(
          queryParams: queryParams);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
