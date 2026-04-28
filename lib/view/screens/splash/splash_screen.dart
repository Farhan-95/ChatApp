import 'package:flutter/material.dart';

import '../../../core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    next();
    super.initState();
  }

  void next()async{
    await Future.delayed(Duration(seconds: 7));
    Navigator.pushReplacementNamed(context, AppRoutes.welcome);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Image.asset(
              'assets/icons/launching_icon.png',
              height: 150,
              width: 150,
            ),
          ),
          Spacer(),
          Text(
            'from',
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/k_image.webp', height: 35, width: 35),
              const Text(
                'Kareem Group',
                style: TextStyle(
                  color: const Color(0xff3aaa35),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
