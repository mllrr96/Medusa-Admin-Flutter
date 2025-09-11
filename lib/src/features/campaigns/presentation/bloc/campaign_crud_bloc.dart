import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/src/core/di/di.dart';
import 'package:medusa_admin/src/core/error/medusa_error.dart';
import 'package:medusa_admin/src/features/campaigns/domain/usecases/campaign/campaign_crud_use_case.dart';
import 'package:medusa_admin_dart_client/medusa_admin_dart_client_v2.dart';

part 'campaign_crud_event.dart';
part 'campaign_crud_state.dart';
part 'campaign_crud_bloc.freezed.dart';

@injectable
class CampaignCrudBloc extends Bloc<CampaignCrudEvent, CampaignCrudState> {
  CampaignCrudBloc(this._campaignCrudUseCase) : super(const CampaignCrudState.initial()) {
    on<CampaignCrudEvent>((event, emit) async {
      await event.map(
        load: (event) async {
          emit(const CampaignCrudState.loading());
          final result = await _campaignCrudUseCase.retrieveCampaign(event.id);
          result.when(
            (campaign) => emit(CampaignCrudState.campaign(campaign)),
            (error) => emit(CampaignCrudState.error(error)),
          );
        },
        loadAll: (event) async {
          emit(const CampaignCrudState.loading());
          final result = await _campaignCrudUseCase.retrieveCampaigns(
            queryParameters: event.queryParameters,
          );
          result.when(
            (response) => emit(CampaignCrudState.campaigns(response.campaigns, response.count)),
            (error) => emit(CampaignCrudState.error(error)),
          );
        },
        create: (event) async {
          emit(const CampaignCrudState.loading());
          final result = await _campaignCrudUseCase.createCampaign(payload: event.payload);
          result.when(
            (campaign) => emit(CampaignCrudState.campaign(campaign)),
            (error) => emit(CampaignCrudState.error(error)),
          );
        },
        update: (event) async {
          emit(const CampaignCrudState.loading());
          final result = await _campaignCrudUseCase.updateCampaign(id: event.id, payload: event.payload);
          result.when(
            (campaign) => emit(CampaignCrudState.campaign(campaign)),
            (error) => emit(CampaignCrudState.error(error)),
          );
        },
        delete: (event) async {
          emit(const CampaignCrudState.loading());
          final result = await _campaignCrudUseCase.deleteCampaign(id: event.id);
          result.when(
            (success) => emit(const CampaignCrudState.deleted()),
            (error) => emit(CampaignCrudState.error(error)),
          );
        },
      );
    });
  }

  final CampaignCrudUseCase _campaignCrudUseCase;
  static CampaignCrudBloc get instance => getIt<CampaignCrudBloc>();
}
