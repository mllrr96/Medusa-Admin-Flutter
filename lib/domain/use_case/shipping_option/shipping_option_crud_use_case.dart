import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class ShippingOptionCrudUseCase {
  ShippingOptionsRepository get _shippingOptionsRepository =>
      getIt<MedusaAdmin>().shippingOptionsRepository;

  Future<Result<ShippingOption, Failure>> create(
      CreateShippingOptionReq userCreateShippingOptionReq) async {
    try {
      final result = await _shippingOptionsRepository.create(
          userCreateShippingOptionReq: userCreateShippingOptionReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ShippingOption, Failure>> update(
      {required String id,
      required UpdateShippingOptionReq userUpdateShippingOptionReq}) async {
    try {
      final result = await _shippingOptionsRepository.update(
          userUpdateShippingOptionReq: userUpdateShippingOptionReq, id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<DeleteShippingOptionRes, Failure>> delete(String id) async {
    try {
      final result = await _shippingOptionsRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<RetrieveAllShippingOptionRes, Failure>> loadAll(
      {Map<String, dynamic>? queryParams}) async {
    try {
      final result = await _shippingOptionsRepository.retrieveAll(
          queryParams: queryParams);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<ShippingOption, Failure>> load(String id,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final result = await _shippingOptionsRepository.retrieve(
          id: id, queryParams: queryParams);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
