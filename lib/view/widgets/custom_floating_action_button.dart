import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/theme_provider.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key,required this.icon,required this.action});

  final Widget icon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: FloatingActionButton(
        onPressed: action,
        child: icon,
        backgroundColor: themeProvider.appColor,
        foregroundColor: themeProvider.isDark?Colors.white:Colors.black,
      ),
    );
  }
}
