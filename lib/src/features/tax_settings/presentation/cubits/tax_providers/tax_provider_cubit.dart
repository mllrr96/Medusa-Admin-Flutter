import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/tax_settings/domain/usecases/tax_provider/tax_provider_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'tax_provider_state.dart';
part 'tax_provider_cubit.freezed.dart';
@injectable
class TaxProviderCubit extends Cubit<TaxProviderState> {
  TaxProviderCubit(TaxProviderUseCase taxProviderUseCase)
      : _useCase = taxProviderUseCase,
        super(const TaxProviderState.initial());

  Future<void> fetch() async {
    emit(const TaxProviderState.loading());
    final result = await _useCase();
    result.when(
      (taxProviders) => emit(TaxProviderState.taxProviders(taxProviders)),
      (error) => emit(TaxProviderState.error(error)),
    );
  }

  final TaxProviderUseCase _useCase;
  static TaxProviderCubit get instance => getIt<TaxProviderCubit>();
}
