import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';

@lazySingleton
class GroupsUseCase {
  static GroupsUseCase get instance => getIt<GroupsUseCase>();
  CustomerGroupRepository get _customerGroupRepository =>
      getIt<MedusaAdmin>().customerGroupRepository;

  Future<Result<RetrieveCustomerGroupsRes, MedusaError>> retrieveCustomerGroups(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.retrieveCustomerGroups(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<DeleteCustomerGroupRes, MedusaError>> deleteCustomerGroup(
      {required String id, Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.deleteCustomerGroup(
          queryParameters: queryParameters, id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
