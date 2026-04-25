import 'package:chat_app/view/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_color_picker.dart';
import '../../../view_model/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  List<Widget> controlIcons = [
    Icon(Icons.lock_open_outlined),
    Icon(Icons.photo_album_outlined),
    Icon(Icons.color_lens_outlined),
  ];
  List controlTitles = [
    'App Permissions',
    'Change theme',
    'Choose color for AppBar',
  ];
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(title: 'Settings', actions: []),
      body: Column(
        children: [
          ListTile(
            leading: controlIcons[0],
            title: Text(
              controlTitles[0],
              style: TextStyle(
                color: themeProvider.isDark?Colors.white:Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () async {
              await openAppSettings();
            },
          ),
          ListTile(
            leading: controlIcons[1],
            title: Text(
              controlTitles[1],
              style: TextStyle(
                color: themeProvider.isDark?Colors.white:Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              themeProvider.toggleTheme();
            },
          ),
          ListTile(
            leading: controlIcons[2],
            title: Text(
              controlTitles[2],
              style: TextStyle(
                color: themeProvider.isDark?Colors.white:Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              pickColor(context);
            },
          ),
        ],
      ),
    );
  }
}
