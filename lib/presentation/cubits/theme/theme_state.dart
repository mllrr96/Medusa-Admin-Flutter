part of '../../cubits/theme/theme_cubit.dart';

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default(ThemeMode.system) ThemeMode themeMode,
    @Default(FlexScheme.indigo) FlexScheme flexScheme,
    @Default(true) bool useMaterial3,
    @Default(AppBarStyle.medium) AppBarStyle appBarStyle,
  }) = _ThemeState;
}
