import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:medusa_admin/data/service/preference_service.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

@injectable
class ThemeCubit extends Cubit<ThemeState> {
  static ThemeCubit get instance => getIt<ThemeCubit>();
  ThemeCubit(this.preferenceService) : super(const ThemeState()){
    loadThemeState();
  }
  void loadThemeState() {
    try {
      emit(ThemeState(
        themeMode: preferenceService.appSettings.themeMode,
        flexScheme: preferenceService.appSettings.colorScheme,
        useMaterial3: preferenceService.appSettings.useMaterial3,
      ));
    } catch (e) {
      debugPrint(e.toString());
      emit(const ThemeState());
    }
  }

  Future<void> updateThemeState({
    ThemeMode? themeMode,
    FlexScheme? flexScheme,
    bool? useMaterial3,
  }) async {
    try {
      await preferenceService.updateAppSettings(
        preferenceService.appSettings.copyWith(
          themeMode: themeMode,
          colorScheme: flexScheme,
          useMaterial3: useMaterial3,
        ),
      );
      if(themeMode != null) {
        await Future.delayed(250.milliseconds);
      }
      emit(state.copyWith(
        themeMode: themeMode ?? state.themeMode,
        flexScheme: flexScheme ?? state.flexScheme,
        useMaterial3: useMaterial3 ?? state.useMaterial3,
      ));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  final PreferenceService preferenceService;
}
