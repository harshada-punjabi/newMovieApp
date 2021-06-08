import 'package:flutter/material.dart';
import 'package:flutter_base_architecture/viewmodels/base_view_model.dart';
import 'package:newfluttermovieapp/presentation/utils/app_colors.dart';


class MovieLandingPageApplicationViewModel extends BaseViewModel {
  MovieLandingPageApplicationViewModel();

  LokoTheme _lokoTheme = LokoTheme.light;

  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData {
    switch (_lokoTheme) {
      case LokoTheme.light:
        return _themeData.copyWith(
            scaffoldBackgroundColor: AppColors.white,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            accentColor: AppColors.accent,
            backgroundColor: AppColors.whiteDim,
            appBarTheme: AppBarTheme(
                brightness: Brightness.light,
                color: AppColors.white,
                textTheme: TextTheme(
                    headline6: TextStyle(
                        fontFamily: 'Montserrat', color: AppColors.primaryColor)),
                iconTheme: IconThemeData(color: AppColors.black)),
            primaryColor: AppColors.primaryColor,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: AppColors.primaryColor,
              selectionHandleColor: AppColors.primaryColor,
              selectionColor: AppColors.gray,
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: InputBorder.none,
              errorStyle: TextStyle(
                color: AppColors.white,
                fontFamily: 'Montserrat',
              ),
              labelStyle: TextStyle(
                color: AppColors.gray,
                fontFamily: 'Montserrat',
              ),
            ),
            textTheme: _themeData.textTheme.apply(fontFamily: 'Montserrat'),
            accentTextTheme:
            _themeData.accentTextTheme.apply(fontFamily: 'Montserrat'),
            primaryTextTheme:
            _themeData.primaryTextTheme.apply(fontFamily: 'Montserrat'),
            iconTheme: IconThemeData(
              color: AppColors.primaryColor,
            ),
            sliderTheme: SliderThemeData(
              activeTrackColor: AppColors.primaryColor.withOpacity(1),
              inactiveTrackColor: AppColors.whiteDim.withOpacity(.5),
              thumbColor: AppColors.primaryColor,
              trackHeight: 4.5,
              overlayColor: AppColors.whiteDim.withOpacity(.4),
              activeTickMarkColor: AppColors.transparent,
              disabledInactiveTickMarkColor: AppColors.transparent,
              disabledActiveTickMarkColor: AppColors.transparent,
              disabledThumbColor: Colors.black,
              showValueIndicator: ShowValueIndicator.always,
              inactiveTickMarkColor: AppColors.transparent,
            ));
      case LokoTheme.dark:
        return _themeData.copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          accentColor: AppColors.amber,
        );
    }
  }

  set lokoTheme(LokoTheme value) {
    _lokoTheme = value;
    notifyListeners();
  }

  toggleTheme() {
    if (_lokoTheme == LokoTheme.dark) {
      lokoTheme = LokoTheme.light;
    } else {
      lokoTheme = LokoTheme.dark;
    }
  }
}

enum LokoTheme {
  dark,
  light,
}