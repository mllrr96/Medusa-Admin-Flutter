part of 'update_discount_bloc.dart';

@freezed
class UpdateDiscountEvent with _$UpdateDiscountEvent {
  const factory UpdateDiscountEvent.updateDiscount(String discountId,UserUpdateDiscountReq updateDiscountReq) =  _UpdateDiscount;
  const factory UpdateDiscountEvent.deleteDiscount(String discountId) = _DeleteDiscount;
}
