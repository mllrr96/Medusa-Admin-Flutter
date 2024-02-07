import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/collection/collections_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'collections_state.dart';
part 'collections_cubit.freezed.dart';

@injectable
class CollectionsCubit extends Cubit<CollectionsState> {
  CollectionsCubit(this.collectionsUseCase) : super(const _Initial());

  Future<void> loadCollections({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    final result = await collectionsUseCase(
        queryParameters: {
          'limit': pageSize,
        }..addAll(queryParameters ?? {}));
    result.when((success) {
      emit(_Collections(success.collections!, success.count ?? 0));
    }, (error) {
      emit(_Error(error));
    });
  }
  final CollectionsUseCase collectionsUseCase;
  static int pageSize = 20;
  static CollectionsCubit get instance => getIt<CollectionsCubit>();
}
