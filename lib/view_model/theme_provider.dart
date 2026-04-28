import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeProvider extends ChangeNotifier{
  SharedPreferences? prefs;
  bool _isDark = false;
  bool get isDark => _isDark;
  Color _appColor = Color(0xff3aaa35);
  Color get appColor => _appColor;

  ThemeProvider(){
    getCustomAppbarColor();
    loadThemeSP();
  }


  void toggleTheme()async{
    _isDark = !_isDark;
    setThemeSP();
    notifyListeners();
  }

  void setThemeSP()async{
    prefs = await SharedPreferences.getInstance();
    await prefs?.setBool('isDarkTheme',_isDark);
  }
  void loadThemeSP()async{
    prefs = await SharedPreferences.getInstance();
    _isDark = prefs?.getBool('isDarkTheme')??true;
    notifyListeners();
  }

  void setCustomAppbarColor(Color color)async{
    _appColor = color;
    prefs = await SharedPreferences.getInstance();
    prefs?.setInt('appBarColor', color.value);
    notifyListeners();
  }
  void getCustomAppbarColor()async{
    prefs = await SharedPreferences.getInstance();
    int? savedColor = prefs?.getInt('appBarColor');
    if(savedColor!=null){
      _appColor = Color(savedColor);
      notifyListeners();
    }
  }
}