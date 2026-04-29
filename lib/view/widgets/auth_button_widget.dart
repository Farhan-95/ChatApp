import 'package:chat_app/view_model/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({super.key,required this.title, required this.onPressed});

  final Widget title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: themeProvider.appColor,
          fixedSize: Size(320, 60)
      ),
      onPressed: onPressed,
      child: title
    );
  }
}
