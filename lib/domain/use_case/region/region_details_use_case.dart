import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class RegionDetailsUseCase {
  RegionsRepository get _regionsRepository =>
      getIt<MedusaAdmin>().regionsRepository;
  ShippingOptionsRepository get _shippingOptionsRepository =>
      getIt<MedusaAdmin>().shippingOptionsRepository;

  static RegionDetailsUseCase get instance => getIt<RegionDetailsUseCase>();

  Future<Result<Region, MedusaError>> fetchRegion(String id, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _regionsRepository.retrieve(id: id, queryParams: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<DeleteRegionRes, MedusaError>> deleteRegion(String id) async {
    try {
      final result = await _regionsRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<DeleteShippingOptionRes, MedusaError>> deleteShippingOption(
      String id) async {
    try {
      final result = await _shippingOptionsRepository.delete(id: id);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<RetrieveAllShippingOptionRes, MedusaError>>
      fetchShippingOptions({
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _shippingOptionsRepository.retrieveAll(
          queryParams: queryParameters);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
