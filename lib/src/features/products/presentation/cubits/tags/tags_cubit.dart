import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/discounts/domain/usecases/discount/tags_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'tags_state.dart';

part 'tags_cubit.freezed.dart';

@injectable
class TagsCubit extends Cubit<TagsState> {
  TagsCubit(TagsUseCase tagsUseCase)
      : _useCase = tagsUseCase,
        super(const _Initial());

  void fetchTags({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    final result = await _useCase(queryParameters: queryParameters);
    result.when((success) => _Tags(success.productTags, success.count), (error) => _Error(error));
  }

  final TagsUseCase _useCase;

  static TagsCubit get instance => getIt<TagsCubit>();
}
