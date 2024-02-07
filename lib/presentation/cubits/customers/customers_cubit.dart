import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/customer/customer_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'customers_state.dart';
part 'customers_cubit.freezed.dart';

@injectable
class CustomersCubit extends Cubit<CustomersState> {
  CustomersCubit(this.customerUseCase) : super(const _Initial());
  Future<void> loadCustomers({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    final result = await customerUseCase.retrieveCustomers(
        queryParameters: {'limit': pageSize, ...?queryParameters});
    result.when(
        (customersRes) => emit(
            _Customers(customersRes.customers ?? [], customersRes.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  final CustomerUseCase customerUseCase;
  static const int pageSize = 20;
  static CustomersCubit get instance => getIt<CustomersCubit>();
}
