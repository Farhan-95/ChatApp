import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/theme_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   const CustomAppBar({super.key,required this.title,required this.actions});

  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      backgroundColor: themeProvider.isDark ? Colors.black : Colors.white,
       title: Text(title,style: TextStyle(fontSize: 28,color: themeProvider.appColor),),
        actions: actions,
    );
  }

  @override
 Size get preferredSize =>Size.fromHeight(kToolbarHeight);
}
