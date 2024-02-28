import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CustomerCrudUseCase {
  CustomerRepository get _customerRepository =>
      getIt<MedusaAdmin>().customerRepository;
  static CustomerCrudUseCase get instance => getIt<CustomerCrudUseCase>();

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
      String id, UserUpdateCustomerReq userUpdateCustomerReq) async {
    try {
      final result = await _customerRepository.update(
          id: id, userUpdateCustomerReq: userUpdateCustomerReq);
      return Success(result!);
    } catch (error) {
      return Error(Failure.from(error));
    }
  }

  Future<Result<Customer, Failure>> retrieve(
      {required String id, Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerRepository.retrieve(
          queryParameters: queryParameters, id: id);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }


  Future<Result<CustomersRes, Failure>> retrieveAll(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerRepository.retrieveCustomers(
          queryParameters: queryParameters);
      return Success(result!);
    } catch (e) {
      return Error(Failure.from(e));
    }
  }

}
