import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/gift_card/gift_cards_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'gift_cards_state.dart';
part 'gift_cards_cubit.freezed.dart';

@injectable
class GiftCardsCubit extends Cubit<GiftCardsState> {
  GiftCardsCubit(this.giftCardsUseCase) : super(const _Initial()) {
  loadGiftCards();
}
  Future<void> loadGiftCards({Map<String, dynamic>? queryParameters}) async {
    emit(const _Loading());
    final result = await giftCardsUseCase.fetchGiftCards(queryParameters: {
      'limit': pageSize,
      ...?queryParameters,
    });
    result.when((success) {
      emit(_GiftCards(success.giftCards!, success.count ?? 0));
    }, (error) {
      emit(_Error(error));
    });
  }

  static const int pageSize = 20;
  static GiftCardsCubit get instance => getIt<GiftCardsCubit>();
  final GiftCardsUseCase giftCardsUseCase;
}
