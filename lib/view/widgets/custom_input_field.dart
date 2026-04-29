import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/theme_provider.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.label,
    required this.hint,
    required this.obSecure,
    this.focus = false,
    this.onChanged,
    this.validator
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String label;
  final String hint;
  final bool obSecure;
  final bool focus ;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return TextFormField(
      autofocus: focus,
      obscureText: obSecure,
      controller: controller,
      style: TextStyle(
        color: themeProvider.isDark ? Colors.white : Colors.black,
      ),
      cursorColor: themeProvider.appColor,
      keyboardType: keyboardType,
      keyboardAppearance: themeProvider.isDark
          ? Brightness.dark
          : Brightness.light,
      decoration: InputDecoration(
        fillColor: Colors.grey,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: Text(label, style: TextStyle(color: Colors.white, fontSize: 17)),
        hintText: hint,
        contentPadding: EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: themeProvider.appColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: themeProvider.isDark ? Colors.white : Colors.black,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: themeProvider.appColor, width: 3),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 3),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
