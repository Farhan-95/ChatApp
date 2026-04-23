import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  iconTheme: IconThemeData(color: Colors.black),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  iconTheme: IconThemeData(color: Colors.white),
  iconButtonTheme: IconButtonThemeData(
    style: IconButton.styleFrom(foregroundColor: Colors.white),
  ),
);
