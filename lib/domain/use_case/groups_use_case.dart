import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:medusa_admin/core/error/failure.dart';

@lazySingleton
class GroupsUseCase {
  static GroupsUseCase get instance => getIt<GroupsUseCase>();
  final CustomerGroupRepository _customerGroupRepository =
      getIt<MedusaAdmin>().customerGroupRepository;

  Future<Result<UserRetrieveCustomerGroupsRes, Failure>> retrieveCustomerGroups(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.retrieveCustomerGroups(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserDeleteCustomerGroupRes, Failure>> deleteCustomerGroup(
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
