part of '../../cubits/language/language_cubit.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState.language(Locale locale) = _Language;
}
