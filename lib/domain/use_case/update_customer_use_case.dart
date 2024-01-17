import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class UpdateCustomerUseCase {
  final CustomerRepository _customerRepository =
      getIt<MedusaAdmin>().customerRepository;
  static UpdateCustomerUseCase get instance => getIt<UpdateCustomerUseCase>();

  Future<Result<Customer, Failure>> create(
      UserCreateCustomerReq userCreateCustomerReq) async {
    try {
      final result = await _customerRepository.create(
          userCreateCustomerReq: userCreateCustomerReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
  Future<Result<Customer, Failure>> update(
      String id,
      UserUpdateCustomerReq userUpdateCustomerReq) async {
    try {
      final result = await _customerRepository.update(id: id, userUpdateCustomerReq: userUpdateCustomerReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }
}
