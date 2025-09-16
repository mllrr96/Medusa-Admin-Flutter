
part of 'price_preferences_bloc.dart';

@freezed
class PricePreferencesEvent with _$PricePreferencesEvent {
  const factory PricePreferencesEvent.loadPricePreference() = _LoadPricePreference;
  const factory PricePreferencesEvent.createPricePreference(CreatePricePreferenceReq payload) = _CreatePricePreference;
  const factory PricePreferencesEvent.deletePricePreference(String id) = _DeletePricePreference;
  const factory PricePreferencesEvent.retrievePricePreference(String id) = _RetrievePricePreference;
  const factory PricePreferencesEvent.updatePricePreference(String id, UpdatePricePreferenceReq payload) = _UpdatePricePreference;
}
