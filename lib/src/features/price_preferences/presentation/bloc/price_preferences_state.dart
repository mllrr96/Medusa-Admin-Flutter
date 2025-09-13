
part of 'price_preferences_bloc.dart';

@freezed
class PricePreferencesState with _$PricePreferencesState {
  const factory PricePreferencesState.initial() = _Initial;
  const factory PricePreferencesState.loading() = _Loading;
  const factory PricePreferencesState.pricePreferences(PricePreferenceListRes pricePreferences) = _PricePreferences;
  const factory PricePreferencesState.pricePreference(PricePreferenceRes pricePreference) = _PricePreference;
  const factory PricePreferencesState.deleted() = _Deleted;
  const factory PricePreferencesState.error(MedusaError failure) = _Error;
}
