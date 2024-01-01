import 'package:injectable/injectable.dart';
import 'package:medusa_admin/app/data/models/app/api_error_handler.dart';
import 'package:medusa_admin/di/di.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';
import 'package:multiple_result/multiple_result.dart';

@injectable
class CustomerUseCase {
  final CustomerRepository _customerRepository =
      getIt<MedusaAdmin>().customerRepository;
  static CustomerUseCase get instance => getIt<CustomerUseCase>();
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

  Future<Result<CustomersRes, Failure>> retrieveCustomers(
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
