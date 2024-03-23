import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/order/order_details_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'order_crud_event.dart';
part 'order_crud_state.dart';
part 'order_crud_bloc.freezed.dart';

@injectable
class OrderCrudBloc extends Bloc<OrderCrudEvent, OrderCrudState> {
  OrderCrudBloc(this.orderCrudUseCase) : super(const _Initial()) {
    on<_Load>(_load);
    on<_Update>(_update);
    on<_Cancel>(_cancel);
    on<_CreateFulfillment>(_createFulfillment);
    on<_CancelFulfillment>(_cancelFulfillment);
    on<_CreateRefund>(_createRefund);
    on<_CreateOrderShipment>(_createOrderShipment);
    on<_CaptureOrderPayment>(_captureOrderPayment);
  }
  Future<void> _load(_Load event, Emitter<OrderCrudState> emit) async {
    emit(const _Loading());
    final result = await orderCrudUseCase.retrieveOrder(
        id: event.id, queryParameters: event.queryParameters);
    result.when((order) => emit(_Order(order)), (error) => emit(_Error(error)));
  }

  Future<void> _update(_Update event, Emitter<OrderCrudState> emit) async {
    emit(const _Loading());
    final result = await orderCrudUseCase.updateOrder(
        id: event.id, userUpdateOrderReq: event.updateOrderReq);
    result.when((order) => emit(_Order(order)), (error) => emit(_Error(error)));
  }

  Future<void> _cancel(_Cancel event, Emitter<OrderCrudState> emit) async {
    emit(const _Loading());
    final result = await orderCrudUseCase.cancelOrder(id: event.id);
    result.when((order) => emit(_Order(order)), (error) => emit(_Error(error)));
  }

  Future<void> _createFulfillment(
      _CreateFulfillment event, Emitter<OrderCrudState> emit) async {
    emit(const _Loading());
    final result = await orderCrudUseCase.createFulfillment(
        id: event.id, userCreateFulfillmentReq: event.userCreateFulfillmentReq);
    result.when((order) => emit(_Order(order)), (error) => emit(_Error(error)));
  }

  Future<void> _cancelFulfillment(
      _CancelFulfillment event, Emitter<OrderCrudState> emit) async {
    emit(const _Loading());
    final result = await orderCrudUseCase.cancelFulfillment(
        id: event.id, fulfillmentId: event.fulfillmentId);
    result.when((order) => emit(_Order(order)), (error) => emit(_Error(error)));
  }

  Future<void> _createRefund(
      _CreateRefund event, Emitter<OrderCrudState> emit) async {
    emit(const _Loading());
    final result = await orderCrudUseCase.createRefund(
        id: event.id,
        userCreateRefundOrdersReq: event.userCreateRefundOrdersReq);
    result.when((order) => emit(_Order(order)), (error) => emit(_Error(error)));
  }

  Future<void> _createOrderShipment(
      _CreateOrderShipment event, Emitter<OrderCrudState> emit) async {
    emit(const _Loading());
    final result = await orderCrudUseCase.createOrderShipment(
        id: event.id,
        fulfillmentId: event.fulfillmentId,
        trackingNumbers: event.trackingNumbers);
    result.when((order) => emit(_Order(order)), (error) => emit(_Error(error)));
  }

  Future<void> _captureOrderPayment(
      _CaptureOrderPayment event, Emitter<OrderCrudState> emit) async {
    emit(const _Loading());
    final result = await orderCrudUseCase.captureOrderPayment(id: event.id);
    result.when((order) => emit(_Order(order)), (error) => emit(_Error(error)));
  }

  final OrderCrudUseCase orderCrudUseCase;
  static OrderCrudBloc get instance => getIt<OrderCrudBloc>();
}
