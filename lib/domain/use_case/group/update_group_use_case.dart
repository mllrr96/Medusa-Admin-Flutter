import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';

@lazySingleton
class UpdateGroupUseCase {
  static UpdateGroupUseCase get instance => getIt<UpdateGroupUseCase>();
  CustomerGroupRepository get _customerGroupRepository =>
      getIt<MedusaAdmin>().customerGroupRepository;

  Future<Result<CustomerGroup, MedusaError>> updateCustomerGroup(
      {required String id,
      required String name,
      Map<String, dynamic>? metadata,
      Map<String, dynamic>? queryParameters,
      }) async {
    try {
      final result = await _customerGroupRepository.updateCustomerGroup(
          queryParameters: queryParameters, id: id, name: name, metadata: metadata);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<CustomerGroup, MedusaError>> createCustomerGroup(
      {required String name,
        Map<String, dynamic>? metadata,
        Map<String, dynamic>? queryParameters,}) async {
    try {
      final result = await _customerGroupRepository.createCustomerGroup(
          queryParameters: queryParameters, name: name, metadata: metadata);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
