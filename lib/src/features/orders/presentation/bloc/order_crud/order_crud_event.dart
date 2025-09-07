part of 'order_crud_bloc.dart';

@freezed
sealed class OrderCrudEvent with _$OrderCrudEvent {
  const factory OrderCrudEvent.load(String id,
      {Map<String, dynamic>? queryParameters}) = _Load;
  const factory OrderCrudEvent.update(
      String id, PostOrdersOrderReq updateOrderReq) = _Update;
  const factory OrderCrudEvent.cancel(String id) = _Cancel;
  const factory OrderCrudEvent.createFulfillment(
      CreateFulfillmentReq userCreateFulfillmentReq) = _CreateFulfillment;
  const factory OrderCrudEvent.cancelFulfillment(
      String id, String fulfillmentId) = _CancelFulfillment;
  // const factory OrderCrudEvent.createRefund(
  //         String id, CreateRefundOrdersReq userCreateRefundOrdersReq) =
  //     _CreateRefund;
  // const factory OrderCrudEvent.createOrderShipment(
  //         String id, String fulfillmentId, {List<String>? trackingNumbers}) =
  //     _CreateOrderShipment;
  // const factory OrderCrudEvent.captureOrderPayment(String id) =
  //     _CaptureOrderPayment;
}
