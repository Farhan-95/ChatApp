import 'package:chat_app/view/screens/home/camera_screen.dart';
import 'package:chat_app/view/screens/home/capture_image_screen.dart';
import 'package:chat_app/view/screens/home/home.dart';
import 'package:chat_app/view/screens/home/setting_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/home';
  static const String setting = '/setting';
  static const String camera = '/camera';
  static const String capturePreview = '/capture_preview';

static Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
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