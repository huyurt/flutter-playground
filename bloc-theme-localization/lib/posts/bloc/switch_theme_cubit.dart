import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../core/helpers/cache_helper.dart';
import '../../core/themes/app_theme.dart';

class SwitchThemeCubit extends Cubit<ThemeData> {
  SwitchThemeCubit({required this.initialTheme}) : super(initialTheme);

  final ThemeData initialTheme;

  void getSavedTheme() {
    final cachedTheme = CacheHelper.getCachedTheme();
    cachedTheme ? emit(AppTheme.darkTheme) : emit(AppTheme.lightTheme);
  }

  Future<void> switchTheme() async {
    bool isDark = state == AppTheme.lightTheme;
    await CacheHelper.cacheTheme(isDark);
    isDark ? emit(AppTheme.darkTheme) : emit(AppTheme.lightTheme);
  }
}
