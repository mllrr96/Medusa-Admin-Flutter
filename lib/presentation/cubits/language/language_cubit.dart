import 'dart:developer';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:medusa_admin/core/constant/strings.dart';
import 'package:medusa_admin/core/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language_state.dart';
part 'language_cubit.freezed.dart';
@injectable
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this.sharedPreferences) : super(const LanguageState.language(Locale('en'))) {
    loadLanguage();
  }

  void loadLanguage() {
    Locale locale;
    try {
      locale = Locale(sharedPreferences.getString(AppConstants.languageKey) ?? 'en');
    } catch (e) {
      locale = const Locale('en');
    }
    if(locale == state.locale) {
      return;
    }
    emit(LanguageState.language(locale));
  }

  Future<void> changeLanguage(Locale locale) async {
    try{
      await sharedPreferences.setString(AppConstants.languageKey, locale.languageCode);
    } catch (e) {
      log(e.toString());
    }
    emit(LanguageState.language(locale));
  }

  final SharedPreferences sharedPreferences;
  static LanguageCubit get instance => getIt<LanguageCubit>();
}
