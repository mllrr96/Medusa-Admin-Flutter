import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/discount/update_condition_use_case.dart';

part 'discount_condition_event.dart';
part 'discount_condition_state.dart';
part 'discount_condition_bloc.freezed.dart';

@injectable
class DiscountConditionBloc
    extends Bloc<DiscountConditionEvent, DiscountConditionState> {
  DiscountConditionBloc(this.updateConditionUseCase) : super(const _Initial()) {
    on<_LoadProducts>(_loadProducts);
    on<_LoadTags>(_loadTags);
    on<_LoadCollections>(_loadCollections);
    on<_LoadGroups>(_loadGroups);
    on<_LoadTypes>(_loadTypes);
  }

  Future<void> _loadTypes(
      _LoadTypes event, Emitter<DiscountConditionState> emit) async {
    final result = await updateConditionUseCase.retrieveProductTypes(
        queryParameters: event.queryParameters);
    result.when(
        (success) =>
            emit(_Loaded(success.productTypes ?? [], success.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  Future<void> _loadGroups(
      _LoadGroups event, Emitter<DiscountConditionState> emit) async {
    final result = await updateConditionUseCase.retrieveCustomerGroups(
        queryParameters: event.queryParameters);
    result.when(
        (success) =>
            emit(_Loaded(success.customerGroups ?? [], success.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  Future<void> _loadProducts(
      _LoadProducts event, Emitter<DiscountConditionState> emit) async {
    final result = await updateConditionUseCase.retrieveProducts(
        queryParameters: event.queryParameters);
    result.when(
        (success) => emit(_Loaded(success.products ?? [], success.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  Future<void> _loadTags(
      _LoadTags event, Emitter<DiscountConditionState> emit) async {
    final result = await updateConditionUseCase.retrieveProductTags(
        queryParameters: event.queryParameters);
    result.when(
        (success) => emit(_Loaded(success.tags ?? [], success.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  Future<void> _loadCollections(
      _LoadCollections event, Emitter<DiscountConditionState> emit) async {
    final result = await updateConditionUseCase.retrieveCollections(
        queryParameters: event.queryParameters);
    result.when(
        (success) =>
            emit(_Loaded(success.collections ?? [], success.count ?? 0)),
        (error) => emit(_Error(error)));
  }

  final UpdateConditionUseCase updateConditionUseCase;
  static DiscountConditionBloc get instance => getIt<DiscountConditionBloc>();
}
