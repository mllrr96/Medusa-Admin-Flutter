import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class SalesChannelCrudUseCase {
  SalesChannelRepository get _salesChannelRepository =>
      getIt<MedusaAdmin>().salesChannelRepository;

  static SalesChannelCrudUseCase get instance =>
      getIt<SalesChannelCrudUseCase>();

  Future<Result<SalesChannel, Failure>> load(
      {required String id, Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _salesChannelRepository.retrieve(
          queryParams: queryParameters, id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<SalesChannelRetrieveAllRes, Failure>> loadAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _salesChannelRepository.retrieveAll(
          queryParams: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<SalesChannel, Failure>> removeProducts(
      {required String id, required List<String> productIds}) async {
    try {
      final result = await _salesChannelRepository
          .removeProductsFromSalesChannel(id: id, productIds: productIds);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<SalesChannel, Failure>> addProducts(
      {required String id, required List<String> productIds}) async {
    try {
      final result = await _salesChannelRepository.addProductsToSalesChannel(
          id: id, productIds: productIds);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<SalesChannelDeleteRes, Failure>> delete(
      String id) async {
    try {
      final result = await _salesChannelRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<SalesChannel, Failure>> create(
      SalesChannelCreateReq userSalesChannelCreateReq) async {
    try {
      final result = await _salesChannelRepository.create(
          userSalesChannelCreateReq: userSalesChannelCreateReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<SalesChannel, Failure>> update(
      {required String id,
      required SalesChannelUpdateReq userSalesChannelUpdateReq}) async {
    try {
      final result = await _salesChannelRepository.update(
          id: id, userSalesChannelUpdateReq: userSalesChannelUpdateReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
