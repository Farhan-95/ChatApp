import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;


  bool isLoggedIn(){
    return _auth.currentUser != null;
  }

}