import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/order/orders_filter_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin.dart';

part 'orders_filter_event.dart';
part 'orders_filter_state.dart';
part 'orders_filter_bloc.freezed.dart';

@injectable
class OrdersFilterBloc extends Bloc<OrdersFilterEvent, OrdersFilterState> {
  OrdersFilterBloc(this.ordersFilterUseCase) : super(const _Initial()) {
    on<_LoadFilters>(_loadFilters);
    add(const _LoadFilters());
  }

  Future<void> _loadFilters(
    _LoadFilters event,
    Emitter<OrdersFilterState> emit,
  ) async {
    emit(const _Loading());
    final result = await ordersFilterUseCase();
    result.when((success) {
      emit(_Loaded(success.$1.regions!, success.$2.salesChannels!));
    }, (error) {
      emit(_Error(error));
    });
  }

  final OrdersFilterUseCase ordersFilterUseCase;
  static OrdersFilterBloc get instance => getIt<OrdersFilterBloc>();
}
