import 'package:injectable/injectable.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';
import '../../app/data/models/app/api_error_handler.dart';

@lazySingleton
class GroupDetailsUseCase {
  static GroupDetailsUseCase get  instance => getIt<GroupDetailsUseCase>();
  final CustomerGroupRepository _customerGroupRepository =
      getIt<MedusaAdmin>().customerGroupRepository;

  Future<Result<UserRetrieveCustomersRes, Failure>> retrieveCustomers(
      {required String id, Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerGroupRepository.retrieveCustomers(
        id: id,
        queryParameters: queryParameters,
      );
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

  Future<Result<UserDeleteCustomerGroupRes, Failure>> deleteCustomerGroup(
      {required String id,
      Map<String, dynamic>? queryParameters}) async {
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
}
