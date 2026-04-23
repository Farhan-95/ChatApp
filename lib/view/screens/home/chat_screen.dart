import 'package:chat_app/view_model/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/responsive.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isDark ? Colors.black : Colors.white,
        title: Text(
          'ChatApp',
          style: TextStyle(
            color: Color(0xff3aaa35),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
        ],
      ),
    );
  }
}
