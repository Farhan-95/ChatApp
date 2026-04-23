import 'package:chat_app/view/screens/home/chat_screen.dart';
import 'package:chat_app/view_model/theme_provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Widget> icons = [
  Icon(Icons.message),
  Icon(Icons.group),
  Icon(Icons.radar_outlined),
  Icon(Icons.call),
];
 int screenIndex = 0;

 List<Widget> screensList = [ChatScreen(),ChatScreen(),ChatScreen(),ChatScreen()];

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final themProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: screensList[screenIndex],
      bottomNavigationBar: CurvedNavigationBar(
        items: icons,
        index: screenIndex,
        backgroundColor: Color(0xff3aaa35),
        buttonBackgroundColor: themProvider.isDark?Colors.black:Colors.white,
        color:themProvider.isDark?Colors.black:Colors.white,
        animationCurve: Curves.decelerate,
        onTap:(value){
          setState(() {
            screenIndex = value;
          });
        },
      ),
    );
  }
}
