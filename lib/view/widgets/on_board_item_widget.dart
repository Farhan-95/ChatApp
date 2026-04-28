import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/on_board_item_model.dart';
import '../../view_model/theme_provider.dart';

class OnBoardItemWidget extends StatelessWidget {
  const OnBoardItemWidget({super.key, required this.item});

  final OnBoardItemModel item;

  @override
  Widget build(BuildContext context) {
    final themProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Container(
        child: Column(
          spacing: 20,
          mainAxisAlignment: .center,
          children: [
            item.image,
            Text(
              item.title,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: themProvider.isDark ? Colors.white : Colors.black,
              ),
            ),
            Text(
              item.subTitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: themProvider.isDark ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
