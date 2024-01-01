import 'package:injectable/injectable.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../app/data/models/app/api_error_handler.dart';

@injectable
class UpdateGroupUseCase {
  static final UpdateGroupUseCase instance = getIt<UpdateGroupUseCase>();
  final CustomerGroupRepository _customerGroupRepository =
      getIt<MedusaAdmin>().customerGroupRepository;

  Future<Result<CustomerGroup, Failure>> updateCustomerGroup(
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

  Future<Result<CustomerGroup, Failure>> createCustomerGroup(
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
