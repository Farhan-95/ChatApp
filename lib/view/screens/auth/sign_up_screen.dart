import 'package:chat_app/view/widgets/auth_button_widget.dart';
import 'package:chat_app/view/widgets/custom_input_field.dart';
import 'package:chat_app/view_model/auth_view_model.dart';
import 'package:chat_app/view_model/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  bool isIconClose = true;
  bool isPasswordHide = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isDark ? Colors.black : Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Create your account',
          style: TextStyle(
            color: themeProvider.appColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 10),
              Center(
                child: Text(
                  'ChatApp will need email and password to create the account.',
                  style: TextStyle(
                    color: themeProvider.isDark ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                height: 60,
                width: 280,
                child: CustomInputField(
                  onChanged: (value) {
                      setState(() {
                        isIconClose = value.isEmpty;
                      });
                  },
                  focus: true,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.mail,
                    color: themeProvider.isDark ? Colors.white : Colors.black,
                  ),
                  suffixIcon: isIconClose
                      ? SizedBox.shrink()
                      : InkWell(
                          onTap: () {
                            emailController.clear();
                            setState(() {
                              isIconClose = true;
                            });
                          },
                          child: Icon(
                            Icons.clear,
                            color: themeProvider.isDark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                  label:
                      ''
                      'Email',
                  hint: 'Enter your mail',
                  obSecure: false,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'email is required';
                    }
                    if (!value.contains('@gmail.com')) {
                      return 'Please enter the valid email';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 60,
                width: 280,
                child: CustomInputField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(
                    CupertinoIcons.lock_fill,
                    color: themeProvider.isDark ? Colors.white : Colors.black,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isPasswordHide = !isPasswordHide;
                      });
                    },
                    child: isPasswordHide
                        ? Icon(
                            Icons.remove_red_eye,
                            color: themeProvider.isDark
                                ? Colors.white
                                : Colors.black,
                          )
                        : Icon(Icons.visibility_off),
                  ),
                  label: 'Password',
                  hint: 'Enter your password',
                  obSecure: isPasswordHide,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'password is greater than 5 characters';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "Already have account",
                    style: TextStyle(
                      color: themeProvider.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signIn);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: themeProvider.appColor),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Consumer<AuthViewModel>(builder: (context,authViewModel,child){
                return AuthButtonWidget(
                  title: authViewModel.isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () async{
                    if (!(formKey.currentState?.validate() ?? false)) return;

                    bool result = await authViewModel.emailVerificationProcess(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    );
                    if (result) {
                      if (!mounted) return;

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.profileAfterVerification,
                            (route) => false,
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(authViewModel.errorMessage?? 'Something went wrong'),
                          backgroundColor: Colors.red,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                );
              }),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
