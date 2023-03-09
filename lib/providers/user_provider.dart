import 'package:flutter/widgets.dart';
import 'package:goly/models/user.dart';
import 'package:goly/services/auth_service.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
  final _authMethods = AuthService();

  UserModel get getUser => _user!;

  Future<void> refreshUser() async {
    UserModel user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
