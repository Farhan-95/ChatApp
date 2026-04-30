import 'package:chat_app/data/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AuthViewModel extends ChangeNotifier {
  AuthRepository auth_repo = AuthRepository();
  bool isLoading = false;
  String? errorMessage;

  Future<bool> emailVerificationProcess(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await auth_repo.sendRequestUserCreation(email, password);

      if (response.user != null) {
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        errorMessage = "User creation failed";
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await auth_repo.signIn(email, password);
      if (response.user != null) {
        isLoading = false;
        notifyListeners();
        return true;
      } else {
        errorMessage = 'Login failed';
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
