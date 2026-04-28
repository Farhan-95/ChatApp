import 'package:chat_app/view/widgets/auth_button_widget.dart';
import 'package:chat_app/view/widgets/image_picker_bottom_sheet.dart';
import 'package:chat_app/view_model/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_routes.dart';

class ProfileScreenAfterRegistration extends StatefulWidget {
  const ProfileScreenAfterRegistration({super.key});

  @override
  State<ProfileScreenAfterRegistration> createState() =>
      _ProfileScreenAfterRegistrationState();
}

class _ProfileScreenAfterRegistrationState
    extends State<ProfileScreenAfterRegistration> {
  TextEditingController userNameController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(height: 60),
            Text(
              'Profile Info',
              style: TextStyle(
                color: themeProvider.appColor,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Please provide your name and optional profile photo.',
              style: TextStyle(
                color: themeProvider.isDark ? Colors.white : Colors.black,
                fontSize: 13,
              ),
            ),
            SizedBox(height: 20),
            Stack(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[200],
                  child: Icon(Icons.person, size: 50, color: Colors.grey[400]),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      CustomBottomSheet.show(
                        context: context,
                        title: 'Pick Image',
                        content: Row(
                          mainAxisAlignment: .spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {Navigator.pushNamed(context, AppRoutes.camera);},
                              child: Icon(Icons.camera),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.image),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xff57A4C3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 60,
              width: 250,
              child: TextField(
                autofocus: true,
                controller: userNameController,
                style: TextStyle(
                  color: themeProvider.isDark ? Colors.white : Colors.black,
                ),
                cursorColor: themeProvider.appColor,
                keyboardType: TextInputType.phone,
                keyboardAppearance: themeProvider.isDark
                    ? Brightness.dark
                    : Brightness.light,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  hintText: 'Enter your user name',
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            Spacer(),
            AuthButtonWidget(
              title: 'Next',
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.home);
              },
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
