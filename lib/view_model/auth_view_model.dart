import 'package:chat_app/data/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/routes/app_routes.dart';

class AuthViewModel extends ChangeNotifier {

  AuthRepository auth_repo = AuthRepository();
  bool isLoading = false;
  String errorMessage = '';

  void isLoggedIn(BuildContext context){
    bool isUserLoggedIn = auth_repo.currentUser();
    if(isUserLoggedIn == true){
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home,(route) => false);
    }
    else{
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.signUp, (route) => false);
    }
  }

  void phoneVerificationProcess(String phone, Function() navigate){
  isLoading = true;
  notifyListeners();
  try{
    auth_repo.sendOTP(phone, (id){
      isLoading = false;
      navigate();
    });
  }
  catch(e){
    isLoading = false;
    errorMessage = e.toString();
    notifyListeners();
  }


  }


}