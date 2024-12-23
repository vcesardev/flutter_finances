import 'package:flutter/material.dart';
import 'package:flutter_finances/models/user.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  get getUserData => _user;

  void setUser(UserModel data) {
    _user = data;
    notifyListeners();
  }

  void logoutUser() {
    _user = null;
    notifyListeners();
  }
}
