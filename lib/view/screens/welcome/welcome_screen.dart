import 'package:chat_app/core/utils/url_launcher_helper.dart';
import 'package:chat_app/view/widgets/auth_button_widget.dart';
import 'package:chat_app/view_model/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            Spacer(),
            Container(
              height: 230,
              width: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(110),
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome.png'),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Welcome to ChatApp',
              style: TextStyle(
                fontSize: 25,
                color: themeProvider.isDark ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Read our Privacy policy. Tap 'Agree and continue' to accept the",
              style: TextStyle(
                fontSize: 11,
                color: themeProvider.isDark ? Colors.white : Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                urlLauncher(
                  'https://www.whatsapp.com/legal/terms-of-service-eea',
                );
              },
              child: Text(
                'Terms and Services',
                style: TextStyle(color: const Color(0xff3aaa35), fontSize: 14),
              ),
            ),
            Spacer(),
            AuthButtonWidget(
              title: 'Agree and Continue',
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.onBoard);
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
