
import 'package:chat_app/data/services/firebase_services/auth_services.dart';

class AuthRepository {
  AuthServices  authServices = AuthServices();

  bool currentUser(){
    bool user = authServices.isLoggedIn();
    return user;
  }
   void sendOTP(String phone , Function(String) success){

   }
}