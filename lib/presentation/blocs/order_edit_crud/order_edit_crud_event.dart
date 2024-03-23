part of 'order_edit_crud_bloc.dart';

@freezed
class OrderEditCrudEvent with _$OrderEditCrudEvent {
  const factory OrderEditCrudEvent.load(String id) = _Load;

  const factory OrderEditCrudEvent.loadAll({
    Map<String, dynamic>? queryParameters,
  }) = _LoadAll;

  const factory OrderEditCrudEvent.create(
    String id,
    String? internalNote,
  ) = _Create;

  const factory OrderEditCrudEvent.update(
    String id,
    String? internalNote,
  ) = _Update;

  const factory OrderEditCrudEvent.request(
    String id,
  ) = _Request;

  const factory OrderEditCrudEvent.addLineItem(
    String id,
    UserAddLineItemReq userAddLineItemReq,
  ) = _AddLineItem;

  const factory OrderEditCrudEvent.deleteLineItem(
    String id,
    String itemId,
  ) = _DeleteLineItem;

  const factory OrderEditCrudEvent.upsertLineItem(
    String id,
    String itemId,
    int quantity,
  ) = _UpsertLineItem;

  const factory OrderEditCrudEvent.deleteLineItemChange(
    String id,
    String changeId,
  ) = _DeleteLineItemChange;

  const factory OrderEditCrudEvent.cancelOrderEdit(
    String id,
  ) = _Cancel;

  const factory OrderEditCrudEvent.confirmOrderEdit(
    String id,
  ) = _Confirm;

  const factory OrderEditCrudEvent.deleteOrderEdit(
    String id,
  ) = _Delete;
}
