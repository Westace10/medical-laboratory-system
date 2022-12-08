import 'package:flutter/material.dart';
import 'package:lab_management_app/ui/shared/color.dart';
import 'package:lab_management_app/ui/shared/text_styles.dart';
import 'package:stacked_themes/stacked_themes.dart';

class AppThemeService {
  static AppThemeService? _instance;
  static ThemeService? _themeService;

  static Future<AppThemeService> getInstance() async {
    _instance ??= AppThemeService();
    _themeService ??= ThemeService.getInstance();

    return _instance!;
  }

  /// Holds values for light mode
  static ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: kWhiteColor,
    brightness: Brightness.light,
    backgroundColor: kWhiteColor,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: kBlackColor),
      foregroundColor: kBlackColor,
      elevation: 0,
      backgroundColor: kWhiteColor,
      titleTextStyle: kHeading2TextStyle.copyWith(
        color: kBlackColor,
      ),
    ),
    toggleableActiveColor: kWhiteColor,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: kBlackColor,
      brightness: Brightness.light,
    ),
  );

  /// Holds values for dark mode
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: kBlackColor,
    brightness: Brightness.dark,
    backgroundColor: kBlackColor,
    scaffoldBackgroundColor: kBlackColor,
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: kWhiteColor),
      elevation: 0,
      color: kBlackColor,
      titleTextStyle: kHeading2TextStyle.copyWith(
        color: kWhiteColor,
      ),
    ),
    toggleableActiveColor: AppColor.kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: kWhiteColor,
      brightness: Brightness.dark,
    ),
  );

  void changeTheme(bool value) {
    if (value) {
      _themeService!.setThemeMode(ThemeManagerMode.dark);
    } else {
      _themeService!.setThemeMode(ThemeManagerMode.light);
    }
  }
}
