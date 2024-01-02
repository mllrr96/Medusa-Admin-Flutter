import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class SalesChannelDetailsUseCase {
  final ProductsRepository _productsRepository =
      getIt<MedusaAdmin>().productsRepository;
  final SalesChannelRepository _salesChannelRepository =
      getIt<MedusaAdmin>().salesChannelRepository;

  static SalesChannelDetailsUseCase instance =
      getIt<SalesChannelDetailsUseCase>();

  Future<Result<UserProductsListRes, Failure>> fetchProducts({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _productsRepository.retrieveAll(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<SalesChannel, Failure>> removeProductsFromSalesChannel(
      {required String id, required List<String> productIds}) async {
    try {
      final result = await _salesChannelRepository
          .removeProductsFromSalesChannel(id: id, productIds: productIds);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<SalesChannel, Failure>> addProductsToSalesChannel(
      {required String id, required List<String> productIds}) async {
    try {
      final result = await _salesChannelRepository.addProductsToSalesChannel(
          id: id, productIds: productIds);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<UserSalesChannelDeleteRes, Failure>> deleteSalesChannel(
      String id) async {
    try {
      final result = await _salesChannelRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
