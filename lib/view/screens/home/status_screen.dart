import 'package:chat_app/view/widgets/custom_app_bar.dart';
import 'package:chat_app/view/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_routes.dart';
import '../../../view_model/theme_provider.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Updates',
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton(
            onSelected: (value){
              if(value == 0){
              }
              else{
                Navigator.pushNamed(context, AppRoutes.setting);
              }
            },
            iconColor: themeProvider.isDark ? Colors.white : Colors.black,
            color: themeProvider.isDark ? Colors.brown.shade900 : Colors.white,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 0,
                  child: Text(
                    'Status Privacy',
                    style: TextStyle(
                      color: themeProvider.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      color: themeProvider.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(
        icon: Icon(Icons.add_a_photo),
        action: () {},
      ),
    );
  }
}
