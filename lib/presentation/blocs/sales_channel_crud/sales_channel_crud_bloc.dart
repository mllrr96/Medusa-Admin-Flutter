import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_channel_crud_event.dart';
part 'sales_channel_crud_state.dart';
part 'sales_channel_crud_bloc.freezed.dart';

class SalesChannelCrudBloc extends Bloc<SalesChannelCrudEvent, SalesChannelCrudState> {
  SalesChannelCrudBloc() : super(const SalesChannelCrudState.initial()) {
    on<SalesChannelCrudEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
