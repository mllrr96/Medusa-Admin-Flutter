part of 'order_edit_crud_bloc.dart';

@freezed
class OrderEditCrudState with _$OrderEditCrudState {
  const factory OrderEditCrudState.initial() = _Initial;
  const factory OrderEditCrudState.loading() = _Loading;
  const factory OrderEditCrudState.deleted() = _Deleted;
  const factory OrderEditCrudState.error(Failure failure) = _Error;
  const factory OrderEditCrudState.orderEdit(OrderEdit orderEdit) = _OrderEdit;
  const factory OrderEditCrudState.orderEdits(List<OrderEdit> orderEdits, int count) = _OrderEdits;
}
