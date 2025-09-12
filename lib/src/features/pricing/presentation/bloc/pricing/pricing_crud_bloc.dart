import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/pricing/domain/usecases/price_list/price_list_details_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'pricing_crud_event.dart';

part 'pricing_crud_state.dart';

part 'pricing_crud_bloc.freezed.dart';

@injectable
class PricingCrudBloc extends Bloc<PricingCrudEvent, PricingCrudState> {
  PricingCrudBloc(this.priceListCrudUseCase) : super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadAll>(_loadAll);
    // on<_LoadProducts>(_loadProducts);
    on<_Delete>(_delete);
    on<_DeleteProduct>(_deleteProduct);
    on<_Create>(_create);
    on<_Update>(_update);
  }

  Future<void> _load(_Load event, Emitter<PricingCrudState> emit) async {
    emit(const PricingCrudState.loading());
    final result = await priceListCrudUseCase.fetch(id: event.id);
    result.when((success) => emit(_PricingList(success)), (error) => emit(_Error(error)));
  }

  Future<void> _loadAll(_LoadAll event, Emitter<PricingCrudState> emit) async {
    emit(const PricingCrudState.loading());
    final result = await priceListCrudUseCase.fetchAll(queryParameters: event.queryParameters);
    result.when((success) => emit(_PricingLists(success.priceLists, success.count)),
        (error) => emit(_Error(error)));
  }

  Future<void> _delete(_Delete event, Emitter<PricingCrudState> emit) async {
    emit(const PricingCrudState.loading());
    final result = await priceListCrudUseCase.delete(id: event.id);
    result.when((success) => emit(const _Deleted()), (error) => emit(_Error(error)));
  }

  Future<void> _create(_Create event, Emitter<PricingCrudState> emit) async {
    emit(const PricingCrudState.loading());
    final result = await priceListCrudUseCase.create(event.userCreatePriceListReq);
    result.when((priceList) => emit(_PricingList(priceList)), (error) => emit(_Error(error)));
  }

  Future<void> _update(_Update event, Emitter<PricingCrudState> emit) async {
    emit(const PricingCrudState.loading());
    final result =
        await priceListCrudUseCase.update(id: event.id, payload: event.userUpdatePriceListReq);
    result.when((priceList) => emit(_PricingList(priceList)), (error) => emit(_Error(error)));
  }

  Future<void> _deleteProduct(_DeleteProduct event, Emitter<PricingCrudState> emit) async {
    emit(const PricingCrudState.loading());
    final result =
        await priceListCrudUseCase.deleteProductPrices(id: event.id, payload: [event.id]);
    result.when(
      (priceList) => emit(_PricingList(priceList)),
      (error) => emit(_Error(error)),
    );
  }

  final PriceListCrudUseCase priceListCrudUseCase;

  static PricingCrudBloc get instance => getIt<PricingCrudBloc>();
  static int pageSize = 10;
}
