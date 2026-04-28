import 'package:chat_app/view/widgets/custom_input_field_for_otp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_routes.dart';
import '../../../view_model/theme_provider.dart';
import '../../widgets/auth_button_widget.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  @override
  void dispose() {
   controller1.dispose();
   controller2.dispose();
   controller3.dispose();
   controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            SizedBox(height: 60),
            Text(
              'Verifying your number ',
              style: TextStyle(color: themeProvider.appColor, fontSize: 17),
            ),
            SizedBox(height: 10),
            Text(
              "You've tried to register ${widget.phoneNumber} recently. Wait before registration an SMS with your code. ",
              style: TextStyle(
                color: themeProvider.isDark ? Colors.white : Colors.black,
                fontSize: 13,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.phoneAuth);
              },
              child: Text(
                'Wrong number?',
                style: TextStyle(color: themeProvider.appColor),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                CustomInputFieldForOtp(controller: controller1),
                CustomInputFieldForOtp(controller: controller2),
                CustomInputFieldForOtp(controller: controller3),
                CustomInputFieldForOtp(controller: controller4),
              ],
            ),
            Spacer(),
            AuthButtonWidget(
              title: 'Next',
              onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.profileAfterVerification,
                  );
              },
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
