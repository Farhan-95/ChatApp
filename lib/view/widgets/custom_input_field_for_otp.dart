import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../view_model/theme_provider.dart';

class CustomInputFieldForOtp extends StatelessWidget {
  const CustomInputFieldForOtp({super.key,required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      height: 60,
      width: 60,
      child: TextFormField(
        controller: controller,
        style: TextStyle(
            color: themeProvider.isDark?Colors.white:Colors.black,
            fontSize: 25
        ),
        onChanged: (value){
          if(value.length == 1){
            FocusScope.of(context).nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        autofocus: true,
        decoration: InputDecoration(
          fillColor: Colors.grey,
          hintText: '0',
          hintStyle: TextStyle(
            color: themeProvider.isDark
                ? Colors.grey.shade300
                : Colors.black,
            fontSize: 25,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: themeProvider.appColor),
          ),
        ),
      ),
    );
  }
}
