import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/medusa_error.dart';
import 'package:medusa_admin/domain/use_case/order/orders_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

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
    final result = await ordersUseCase.retrieveOrders(
      event.queryParameters);
        //     queryParameters:
        //         // TODO: add event.queryParameters if needed
        //         GetOrdersQueryParameters(
        //   limit: pageSize,
        //   fields: _expandParameters['fields'] as String?,
        // )
        // {
        //   'limit': pageSize,
        //   ..._expandParameters,
        //   ...?event.queryParameters,
        // }

        // );
    result.when((ordersResponse) {
      emit(_Orders(ordersResponse.orders, ordersResponse.count.toInt() ?? 0));
    }, (error) {
      emit(_Error(error));
    });
  }

  // -------------------------------------------------------------------------//
  static const int pageSize = 20;
  static const Map<String, dynamic> _expandParameters = {
    'fields':
        'id,status,display_id,created_at,email,fulfillment_status,payment_status,total,currency_code,customer,*items,*cart,*customer,*shipping_address,*sales_channel,*currency',
  };

  // -------------------------------------------------------------------------//
  final OrdersUseCase ordersUseCase;

  static OrdersBloc get instance => getIt<OrdersBloc>();
}
