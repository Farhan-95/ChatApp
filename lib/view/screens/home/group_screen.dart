import 'package:chat_app/view/widgets/custom_app_bar.dart';
import 'package:chat_app/view/widgets/custom_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_routes.dart';
import '../../../view_model/theme_provider.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({super.key});

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Groups',
        actions: [PopupMenuButton(
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
                  'New group',
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
        ),],
      ),
      floatingActionButton: CustomFloatingActionButton(
        icon: Icon(Icons.add),
        action: () {},
      ),
    );
  }
}
