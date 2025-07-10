
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_home_app/core/services/cache_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  Future<void> init() async {
    getLang();
  }


  void setLangAr() {
    emit(AppLocaleState());
    local = 'ar';
    CacheHelper.sharedPreferences.setString('lang', local);
    getLang();
  }

  void setLangEn() {
    emit(AppLocaleState());
    local = 'en';
    CacheHelper.sharedPreferences.setString('lang', local);
    getLang();
  }

  void changLang() {
    if (CacheHelper.sharedPreferences.getString('lang') == 'ar') {
      setLangEn();
    } else {
      setLangAr();
    }
  }

  void getLang() {
    CacheHelper.sharedPreferences.getString('lang');
    emit(AppLocaleChangeState());
  }

  String local = 'ar';

}