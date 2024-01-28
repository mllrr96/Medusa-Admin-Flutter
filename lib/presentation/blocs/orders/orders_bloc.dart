import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/order/orders_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'orders_event.dart';
part 'orders_state.dart';
part 'orders_bloc.freezed.dart';

@injectable
class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc(this.ordersUseCase) : super(const _Initial()) {
    on<_LoadOrders>(_loadOrders);
  }

  Future<void> _loadOrders(
    _LoadOrders event,
    Emitter<OrdersState> emit,
  ) async {
    emit(const _Loading());
    int offset = state.mapOrNull(orders: (_) => _.orders.length) ?? 0;
    final result = await ordersUseCase.retrieveOrders(
        queryParameters: {
      'offset': offset,
      'limit': pageSize,
    }
          ..addAll(_expandParameters)
          ..addAll(event.queryParameters ?? {}));
    result.when((success) {
      emit(_Orders(success.orders!));
    }, (error) {
      emit(_Error(error));
    });
  }

  // -------------------------------------------------------------------------//
  static const int pageSize = 20;
  static const Map<String, dynamic> _expandParameters = {
    'expand': 'items,cart,customer,shipping_address,sales_channel,currency',
    'fields':
        'id,status,display_id,created_at,email,fulfillment_status,payment_status,total,currency_code,customer',
  };
  // -------------------------------------------------------------------------//
  final OrdersUseCase ordersUseCase;
  static OrdersBloc get instance => getIt<OrdersBloc>();
}
