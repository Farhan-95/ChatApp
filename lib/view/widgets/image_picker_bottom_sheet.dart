import 'package:flutter/material.dart';

class CustomBottomSheet {
  static void show({
    required BuildContext context,
    required String title,
    required Widget content,
    String? subTitle,
    VoidCallback? onClose,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows sheet to expand with keyboard
      backgroundColor: Colors.transparent, // Important for rounded corners
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            // Adjusts for keyboard if user is typing inside the sheet
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Sheet takes only needed height
            children: [
              // The "Handle" at the top
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              if (subTitle != null) ...[
                const SizedBox(height: 8),
                Text(subTitle, style: TextStyle(color: Colors.grey[600])),
              ],
              const SizedBox(height: 20),
              content, // The specific UI you want inside
            ],
          ),
        );
      },
    );
  }
}