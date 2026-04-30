import 'package:chat_app/view/widgets/auth_button_widget.dart';
import 'package:chat_app/view_model/auth_view_model.dart';
import 'package:chat_app/view_model/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/app_routes.dart';
import '../../widgets/custom_input_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  bool isCloseIcon = true;
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
        leading: BackButton(
          color: themeProvider.isDark ? Colors.white : Colors.black,
        ),
        backgroundColor: themeProvider.isDark ? Colors.black : Colors.white,
        centerTitle: true,
        title: Text(
          'Log In with your account',
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
              Text(
                'ChatApp will need to verify you.',
                style: TextStyle(
                  color: themeProvider.isDark ? Colors.white : Colors.black,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 280,
                child: CustomInputField(
                  onChanged: (value) {
                    setState(() {
                      isCloseIcon = value.isEmpty;
                    });
                  },
                  focus: true,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Icons.mail,
                    color: themeProvider.isDark ? Colors.white : Colors.black,
                  ),
                  suffixIcon: isCloseIcon
                      ? SizedBox()
                      : InkWell(
                          onTap: () {
                            emailController.clear();
                            setState(() {
                              isCloseIcon = true;
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
                children: [
                  SizedBox(width: 175),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(color: themeProvider.appColor),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "Don't have account",
                    style: TextStyle(
                      color: themeProvider.isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.signUp);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: themeProvider.appColor),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Consumer<AuthViewModel>(builder: (context, authViewModel,child){
                return AuthButtonWidget(
                  title: authViewModel.isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () async{
                    if (formKey.currentState!.validate()) {
                      bool success = await authViewModel.signIn(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                      if (success) {
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(authViewModel.errorMessage.toString()),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                );
              }),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
