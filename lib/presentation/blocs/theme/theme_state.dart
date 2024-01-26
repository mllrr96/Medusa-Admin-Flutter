part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState({
   @Default(ThemeMode.system) ThemeMode themeMode,
   @Default(FlexScheme.indigo) FlexScheme flexScheme,
   @Default(true) bool useMaterial3,
}) = _ThemeState;
}
