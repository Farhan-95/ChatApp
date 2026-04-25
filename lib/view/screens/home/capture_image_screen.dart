import 'package:flutter/material.dart';
import 'dart:io';


class CaptureImageScreen extends StatefulWidget {
  final String imagePath;

  const CaptureImageScreen({super.key, required this.imagePath});

  @override
  State<CaptureImageScreen> createState() => _CaptureImageScreenState();
}

class _CaptureImageScreenState extends State<CaptureImageScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox.expand(
        child: Image.file(
          File(widget.imagePath),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}