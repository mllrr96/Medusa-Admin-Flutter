import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/customer/update_customer_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'customer_crud_event.dart';
part 'customer_crud_state.dart';
part 'customer_crud_bloc.freezed.dart';

@injectable
class CustomerCrudBloc extends Bloc<CustomerCrudEvent, CustomerCrudState> {
  CustomerCrudBloc(this.customerCrudUseCase) : super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    on<_Create>(_create);
    on<_Update>(_update);
    // on<_Delete>(_delete);
  }
  Future<void> _load(
    _Load event,
    Emitter<CustomerCrudState> emit,
  ) async {
    emit(const _Loading());
    final result = await customerCrudUseCase.retrieve(id: event.id);
    result.when((customer) {
      emit(_Customer(customer));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _create(
    _Create event,
    Emitter<CustomerCrudState> emit,
  ) async {
    emit(const _Loading());
    final result = await customerCrudUseCase.create(event.userCreateCustomerReq);
    result.when((customer) {
      emit(_Customer(customer));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _update(
    _Update event,
    Emitter<CustomerCrudState> emit,
  ) async {
    emit(const _Loading());
    final result = await customerCrudUseCase.update(event.id, event.userUpdateCustomerReq);
    result.when((customer) {
      emit(_Customer(customer));
    }, (error) {
      emit(_Error(error));
    });
  }

  // Future<void> _delete(
  //   _Delete event,
  //   Emitter<CustomerCrudState> emit,
  // ) async {
  //   emit(const _Loading());
  //   final result = await customerCrudUseCase.delete(id: event.id);
  //   result.when((customer) {
  //     emit(_Customer(customer));
  //   }, (error) {
  //     emit(_Error(error));
  //   });
  // }

  Future<void> _loadAll(
    _LoadAll event,
    Emitter<CustomerCrudState> emit,
  ) async {
    emit(const _Loading());
    final result = await customerCrudUseCase.retrieveAll(queryParameters: {'limit': pageSize, ...?event.queryParameters});
    result.when((response) {
      emit(_Customers(response.customers ?? [], response.count ?? 0));
    }, (error) {
      emit(_Error(error));
    });
  }


  final CustomerCrudUseCase customerCrudUseCase;
  static const int pageSize = 20;
  static CustomerCrudBloc get instance => getIt<CustomerCrudBloc>();
}
