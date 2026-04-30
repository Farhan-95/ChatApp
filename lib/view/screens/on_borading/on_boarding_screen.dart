import 'package:chat_app/core/constants.dart';
import 'package:chat_app/data/models/on_board_item_model.dart';
import 'package:chat_app/view/widgets/auth_button_widget.dart';
import 'package:chat_app/view/widgets/on_board_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/routes/app_routes.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();

  void getStarted() async {
    if (pageIndex < onBoardItems.length - 1) {
      pageController.nextPage(
        duration: (Duration(milliseconds: 300)),
        curve: Curves.ease,
      );
    } else {
      await Permission.notification.request();
      await Permission.storage.request();
      await Permission.location.request();
      await Permission.microphone.request();

      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setBool('isFirstTime', false);

      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.signIn,(route)=> false);
    }
  }

  int pageIndex = 0;
  List<dynamic> onBoardItems = [
    OnBoardItemModel(
      title: 'Connect Freely',
      subTitle:
          'Tap to chat, share media, and keep the conversation flowing seamlessly.',
      image: Image.asset('assets/images/onBoarding1.png'),
    ),
    OnBoardItemModel(
      title: 'Form a Community',
      subTitle:
          'Bring friends, family, or teams together in private group chats.',
      image: Image.asset('assets/images/onBoarding2.png'),
    ),
    OnBoardItemModel(
      title: 'Share Your Location',
      subTitle:
          'Let friends and family know where you are or find nearby meet-up spots in one tap.',
      image: Image.asset('assets/images/onBoarding.png'),
    ),
  ];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          spacing: 20,
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                itemCount: onBoardItems.length,
                itemBuilder: (context, index) {
                  return OnBoardItemWidget(item: onBoardItems[index]);
                },
              ),
            ),
            Row(
              spacing: 10,
              mainAxisAlignment: .center,
              children: List.generate(onBoardItems.length, (index) {
                return Container(
                  height: 8,
                  width: pageIndex == index ? 18 : 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: pageIndex == index ? color : Colors.grey,
                  ),
                );
              }),
            ),
            AuthButtonWidget(
              title: pageIndex < onBoardItems.length - 1
                  ? Text(
                      'Next',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  : Text(
                      'Get Started',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
              onPressed: getStarted,
            ),
          ],
        ),
      ),
    );
  }
}
