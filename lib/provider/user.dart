import 'package:flutter/cupertino.dart';
import '../model/user.dart';

class UserProvider with ChangeNotifier{
  UserModel _model = UserModel();

  void setUser(UserModel model){
    _model = model;
    notifyListeners();
  }

  UserModel getUser() => _model;

}