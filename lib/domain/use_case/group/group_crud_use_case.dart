import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class GroupCrudUseCase {
  static GroupCrudUseCase get instance => getIt<GroupCrudUseCase>();
  CustomerGroupRepository get _customerGroupRepository =>
      getIt<MedusaAdmin>().customerGroupRepository;

  Future<Result<UserRetrieveCustomerGroupsRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.retrieveCustomerGroups(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<CustomerGroup, Failure>> removeCustomers(
      {required String id,
      required List<String> customerIds,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.removeCustomers(
        id: id,
        customerIds: customerIds,
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<CustomerGroup, Failure>> addCustomers(
      {required String id,
      required List<String> customerIds,
      Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.addCustomers(
        id: id,
        customerIds: customerIds,
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<UserDeleteCustomerGroupRes, Failure>> delete(
      {required String id, Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.deleteCustomerGroup(
        id: id,
        queryParameters: queryParameters,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<CustomerGroup, Failure>> update({
    required String id,
    required String name,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _customerGroupRepository.updateCustomerGroup(
          queryParameters: queryParameters,
          id: id,
          name: name,
          metadata: metadata);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<CustomerGroup, Failure>> retrieve({
    required String id,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _customerGroupRepository.retrieveCustomerGroup(
        queryParameters: queryParameters,
        id: id,
      );
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

  Future<Result<CustomerGroup, Failure>> create({
    required String name,
    Map<String, dynamic>? metadata,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _customerGroupRepository.createCustomerGroup(
          queryParameters: queryParameters, name: name, metadata: metadata);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }
}
