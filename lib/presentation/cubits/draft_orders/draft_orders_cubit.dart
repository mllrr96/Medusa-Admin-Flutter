import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/draft_order/drafts_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'draft_orders_state.dart';
part 'draft_orders_cubit.freezed.dart';
@injectable
class DraftOrdersCubit extends Cubit<DraftOrdersState> {
  static int pageSize = 20;
  DraftOrdersCubit(this.draftsUseCase) : super(const _Initial());
  Future<void> loadDraftOrders({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    int offset = state.mapOrNull(draftOrders: (_) => _.draftOrders.length) ?? 0;

    final result = await draftsUseCase(queryParameters: {
      'offset': offset,
      'limit': pageSize,
    }..addAll(queryParameters ?? {}));
    result.when((success) {
      emit(_DraftOrders(success.draftOrders!, success.count ?? 0));
    }, (error) {
      emit(_Error(error));
    });
  }

  final DraftsUseCase draftsUseCase;
  static DraftOrdersCubit get instance => getIt<DraftOrdersCubit>();
}
