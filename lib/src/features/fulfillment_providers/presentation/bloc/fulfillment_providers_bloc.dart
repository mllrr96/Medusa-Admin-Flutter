import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/fulfillment_providers/domain/usecases/list_fulfillment_options_use_case.dart';
import 'package:medusa_admin/src/features/fulfillment_providers/domain/usecases/list_fulfillment_providers_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'fulfillment_providers_event.dart';
part 'fulfillment_providers_state.dart';
part 'fulfillment_providers_bloc.freezed.dart';

@injectable
class FulfillmentProvidersBloc extends Bloc<FulfillmentProvidersEvent, FulfillmentProvidersState> {
  FulfillmentProvidersBloc(
    this._listFulfillmentProvidersUseCase,
    this._listFulfillmentOptionsUseCase,
  ) : super(const _Initial()) {
    on<_Load>(_load);
    on<_LoadOptions>(_loadOptions);
  }

  final ListFulfillmentProvidersUseCase _listFulfillmentProvidersUseCase;
  final ListFulfillmentOptionsUseCase _listFulfillmentOptionsUseCase;

  Future<void> _load(
    _Load event,
    Emitter<FulfillmentProvidersState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listFulfillmentProvidersUseCase(query: event.query);
    result.when(
      (fulfillmentProviders) => emit(_FulfillmentProviders(fulfillmentProviders)),
      (error) => emit(_Error(error)),
    );
  }

  Future<void> _loadOptions(
    _LoadOptions event,
    Emitter<FulfillmentProvidersState> emit,
  ) async {
    emit(const _Loading());
    final result = await _listFulfillmentOptionsUseCase(event.id);
    result.when(
      (fulfillmentOptions) => emit(_FulfillmentOptions(fulfillmentOptions)),
      (error) => emit(_Error(error)),
    );
  }

  static FulfillmentProvidersBloc get instance => getIt<FulfillmentProvidersBloc>();
}
