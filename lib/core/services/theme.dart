import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      //primaryColor: ,
      textTheme: TextTheme(
          headline1: GoogleFonts.cairo(),
          bodyText1: GoogleFonts.cairo(),
          bodyText2: GoogleFonts.cairo(),
          overline: GoogleFonts.cairo(),
          subtitle1: GoogleFonts.cairo(),
          subtitle2: GoogleFonts.cairo(),
          caption: GoogleFonts.cairo(),
          button: GoogleFonts.cairo(),
          headline2: GoogleFonts.cairo(),
          headline3: GoogleFonts.cairo(),
          headline4: GoogleFonts.cairo(),
          headline5: GoogleFonts.cairo(),
          headline6: GoogleFonts.cairo()));
  static final dark = ThemeData.dark().copyWith(
      //scaffoldBackground Color(0xff23f788),

      //button Colors.blue,
      textTheme: TextTheme(
          headline1: GoogleFonts.cairo(),
          bodyText1: GoogleFonts.cairo(),
          bodyText2: GoogleFonts.cairo(),
          overline: GoogleFonts.cairo(),
          subtitle1: GoogleFonts.cairo(),
          subtitle2: GoogleFonts.cairo(),
          caption: GoogleFonts.cairo(),
          button: GoogleFonts.cairo(),
          headline2: GoogleFonts.cairo(),
          headline3: GoogleFonts.cairo(),
          headline4: GoogleFonts.cairo(),
          headline5: GoogleFonts.cairo(),
          headline6: GoogleFonts.cairo()));
}

class ThemeService {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  void switchTheme() {
    print("clicked");
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
