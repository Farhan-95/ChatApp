
import 'package:chat_app/data/services/firebase_services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  AuthServices  authServices = AuthServices();

  bool currentUser(){
    bool user = authServices.isLoggedIn();
    return user;
  }
   Future<dynamic> sendRequestUserCreation(String email,String password )async{
        try{
          final userCredential = await authServices.createUser(email, password);
          return userCredential;
        }on FirebaseAuthException catch(e){
          throw Exception(errorHandling(e)) ;
        }catch(e){
          throw Exception('Something went wrong');
        }
   }

   Future<dynamic> signIn(String email, String password)async{
      try{
        final userCredential = await authServices.signIn(email, password);
        return userCredential;
      } on FirebaseAuthException catch(e){
        throw Exception(errorHandling(e));
      }catch(e){
        throw Exception('Something went wrong');
      }
   }

   String errorHandling (FirebaseAuthException  e){
    switch(e.code){
      case 'email-already-in-use' :
        return 'Email is already registered';
      case 'weak-password':
        return 'Your password is weak';
      case 'invalid-email':
        return 'Invalid email format';
      case 'user-not-found':
        return 'No user found';
      case 'wrong-password':
        return 'Incorrect password';
      default:
        return 'Authentication failed';
    }
   }

}