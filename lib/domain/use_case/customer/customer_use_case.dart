import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';
import 'package:multiple_result/multiple_result.dart';

@lazySingleton
class CustomerUseCase {
  CustomersRepository get _customerRepository => _medusaAdminV2.customers;
  static CustomerUseCase get instance => getIt<CustomerUseCase>();
  final MedusaAdminV2 _medusaAdminV2;

  CustomerUseCase(this._medusaAdminV2);
  Future<Result<Customer, MedusaError>> retrieve(
      {required String id, Map<String, dynamic>? queryParameters}) async {
    try {
      final result = await _customerRepository.retrieve( id, query: queryParameters);
      return Success(result.customer);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }

  Future<Result<CustomersListRes, MedusaError>> retrieveCustomers(
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final result =
          await _customerRepository.list(query: queryParameters);
      return Success(result);
    } on DioException catch (e) {
      return Error(MedusaError.fromHttp(
        status: e.response?.statusCode,
        body: e.response?.data,
        cause: e,
      ));
    } catch (error) {
      return Error(
          MedusaError(code: 'unknown', type: 'unknown', message: error.toString()));
    }
  }
}
