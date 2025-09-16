import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/promotions/domain/usecases/promotion/update_condition_use_case.dart';

part 'promotion_condition_event.dart';
part 'promotion_condition_state.dart';
part 'promotion_condition_bloc.freezed.dart';

@injectable
class PromotionConditionBloc
    extends Bloc<PromotionConditionEvent, PromotionConditionState> {
  PromotionConditionBloc(this.updateConditionUseCase) : super(const _Initial()) {
    on<_LoadProducts>(_loadProducts);
    on<_LoadTags>(_loadTags);
    on<_LoadCollections>(_loadCollections);
    on<_LoadGroups>(_loadGroups);
    on<_LoadTypes>(_loadTypes);
  }

  Future<void> _loadTypes(
      _LoadTypes event, Emitter<PromotionConditionState> emit) async {
    final result = await updateConditionUseCase.retrieveProductTypes(
        queryParameters: event.queryParameters);
    result.when((success) => emit(_Loaded(success.productTypes, success.count)),
        (error) => emit(_Error(error)));
  }

  Future<void> _loadGroups(
      _LoadGroups event, Emitter<PromotionConditionState> emit) async {
    final result = await updateConditionUseCase.retrieveCustomerGroups(
        queryParameters: event.queryParameters);
    result.when(
        (success) => emit(_Loaded(success.customerGroups, success.count)),
        (error) => emit(_Error(error)));
  }

  Future<void> _loadProducts(
      _LoadProducts event, Emitter<PromotionConditionState> emit) async {
    final result = await updateConditionUseCase.retrieveProducts(
        queryParameters: event.queryParameters);
    result.when((success) => emit(_Loaded(success.products, success.count)),
        (error) => emit(_Error(error)));
  }

  Future<void> _loadTags(
      _LoadTags event, Emitter<PromotionConditionState> emit) async {
    final result = await updateConditionUseCase.retrieveProductTags(
        queryParameters: event.queryParameters);
    result.when((success) => emit(_Loaded(success.productTags, success.count)),
        (error) => emit(_Error(error)));
  }

  Future<void> _loadCollections(
      _LoadCollections event, Emitter<PromotionConditionState> emit) async {
    final result = await updateConditionUseCase.retrieveCollections(
        queryParameters: event.queryParameters);
    result.when((success) => emit(_Loaded(success.collections, success.count)),
        (error) => emit(_Error(error)));
  }

  final UpdateConditionUseCase updateConditionUseCase;
  static PromotionConditionBloc get instance => getIt<PromotionConditionBloc>();
}
