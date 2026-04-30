import 'package:chat_app/core/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

         SharedPreferences sp = await SharedPreferences.getInstance();
         bool isFirstTime = sp.getBool('isFirstTime')??true;
         if(isFirstTime){
           Navigator.pushReplacementNamed(context, AppRoutes.welcome);
         }
         else{
           User? user = FirebaseAuth.instance.currentUser;
           if(user != null){
             Navigator.pushReplacementNamed(context, AppRoutes.home);
           } else
           {
             Navigator.pushReplacementNamed(context, AppRoutes.signIn);
           }
         }
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
