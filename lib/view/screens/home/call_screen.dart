import 'package:chat_app/view/widgets/custom_app_bar.dart';
import 'package:chat_app/view/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_routes.dart';
import '../../../view_model/theme_provider.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Calls',
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
                    'Clear call log',
                    style: TextStyle(
                      color: themeProvider.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                PopupMenuItem(
                  value : 1,
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
        icon: Icon(Icons.add_call),
        action: () {},
      ),
    );
  }
}
