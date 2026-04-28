import 'package:chat_app/view/widgets/auth_button_widget.dart';
import 'package:chat_app/view_model/theme_provider.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_routes.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final countryPicker = const FlCountryCodePicker();
  CountryCode? pickedCode;
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
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
              'Enter your phone number',
              style: TextStyle(color: themeProvider.appColor, fontSize: 17),
            ),
            SizedBox(height: 10),
            Text(
              'ChatApp will need to verify your phone number.',
              style: TextStyle(
                color: themeProvider.isDark ? Colors.white : Colors.black,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 60,
                  child: pickedCode != null ? pickedCode?.flagImage() : null,
                ),
                InkWell(
                  onTap: () async {
                    final code = await countryPicker.showPicker(
                      context: context,

                    );
                    setState(() {
                      pickedCode = code;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 35,
                    width: 60,
                    decoration: BoxDecoration(
                      color: themeProvider.appColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text(pickedCode?.dialCode ?? '+1')),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  height: 60,
                  width: 200,
                  child: TextField(
                    autofocus: true,
                    controller: phoneController,
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
                      hintText: 'Enter your phone number',
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            AuthButtonWidget(
              title: 'Next',
              onPressed: () {
                if (phoneController.text.isEmpty || pickedCode == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Phone number is required'),
                      backgroundColor: Colors.grey,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
                else {
                  String rawPhone = phoneController.text.trim();
                  if (rawPhone.startsWith('0')) {
                    rawPhone = rawPhone.substring(1);
                  }
                  String fullPhone = '${pickedCode?.dialCode}$rawPhone';
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.verification,
                    arguments: fullPhone,
                  );
                }
              },
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
