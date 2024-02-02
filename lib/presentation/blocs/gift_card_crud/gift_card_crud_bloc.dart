import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/error/failure.dart';
import 'package:medusa_admin/domain/use_case/gift_card/gift_cards_use_case.dart';
import 'package:medusa_admin_flutter/medusa_admin.dart';

part 'gift_card_crud_event.dart';
part 'gift_card_crud_state.dart';
part 'gift_card_crud_bloc.freezed.dart';

@injectable
class GiftCardCrudBloc extends Bloc<GiftCardCrudEvent, GiftCardCrudState> {
  GiftCardCrudBloc(this.giftCardsUseCase) : super(const _Initial()) {
    on<_Load>(_load);
    on<_Create>(_create);
    on<_Update>(_update);
    on<_Delete>(_delete);
  }
  Future<void> _load(
    _Load event,
    Emitter<GiftCardCrudState> emit,
  ) async {
    emit(const GiftCardCrudState.loading());
    final result = await giftCardsUseCase.fetchGiftCard(event.id);
    result.when((giftCard) {
      emit(_GiftCard(giftCard));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _create(
    _Create event,
    Emitter<GiftCardCrudState> emit,
  ) async {
    emit(const GiftCardCrudState.loading());
    final result = await giftCardsUseCase.create(event.userCreateGiftCardReq);
    result.when((giftCard) {
      emit(_GiftCard(giftCard));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _update(
    _Update event,
    Emitter<GiftCardCrudState> emit,
  ) async {
    emit(const GiftCardCrudState.loading());
    final result = await giftCardsUseCase.update(
        id: event.id, userUpdateGiftCardReq: event.userUpdateGiftCardReq);
    result.when((giftCard) {
      emit(_GiftCard(giftCard));
    }, (error) {
      emit(_Error(error));
    });
  }

  Future<void> _delete(
    _Delete event,
    Emitter<GiftCardCrudState> emit,
  ) async {
    emit(const GiftCardCrudState.loading());
    final result = await giftCardsUseCase.delete(event.id);
    result.when((giftCard) {
      emit(const _Deleted());
    }, (error) {
      emit(_Error(error));
    });
  }

  final GiftCardsUseCase giftCardsUseCase;
}
