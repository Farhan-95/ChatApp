import 'package:chat_app/view/screens/auth/sign_up_screen.dart';
import 'package:chat_app/view/screens/profile/profile_screen_after_registration.dart';
import 'package:chat_app/view/screens/auth/sign_in_screen.dart';
import 'package:chat_app/view/screens/home/camera_capture_image_screen/camera_screen.dart';
import 'package:chat_app/view/screens/home/camera_capture_image_screen/capture_image_screen.dart';
import 'package:chat_app/view/screens/home/home.dart';
import 'package:chat_app/view/screens/home/setting_screen/setting_screen.dart';
import 'package:chat_app/view/screens/splash/splash_screen.dart';
import 'package:chat_app/view/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../view/screens/on_borading/on_boarding_screen.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String onBoard = '/onBoard';
  static const String signUp = '/signUp';
  static const String signIn = '/signIn';
  static const String profileAfterVerification = '/profileAfterVerification';
  static const String home = '/home';
  static const String setting = '/setting';
  static const String camera = '/camera';
  static const String capturePreview = '/capturePreview';

static Route<dynamic> generateRoute(RouteSettings settings){
  final args = settings.arguments;
  switch(settings.name){
    case splash:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case welcome:
      return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    case onBoard:
      return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    case signUp:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    case signIn:
      return MaterialPageRoute(builder: (_) => SignInScreen());
    case profileAfterVerification:
      return MaterialPageRoute(builder: (_) => const ProfileScreenAfterRegistration());
    case home:
      return MaterialPageRoute(builder: (_) => const Home());
    case setting:
      return MaterialPageRoute(builder: (_) => const SettingScreen());
    case camera:
      return MaterialPageRoute(builder: (_) => const MobileCameraScreen());
    case capturePreview:
      final imagePath = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => CaptureImageScreen(imagePath: imagePath),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
}