import 'package:flutter/material.dart';

import '../../core/constants.dart';

class AuthButtonWidget extends StatelessWidget {
  const AuthButtonWidget({super.key,required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          fixedSize: Size(320, 60)
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
