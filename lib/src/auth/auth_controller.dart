import 'package:flutter/cupertino.dart';
import 'package:unwind_app/model/user.dart';
import 'package:unwind_app/src/auth/auth_service.dart';

class AuthController with ChangeNotifier {
  AuthController(this._authService);

  final AuthService _authService;

  String? _userToken;
  String? get userToken => _userToken;

  User? _user;
  User? get user => _user;

  bool get isConnected => _user != null;

  Future<void> initAuth() async {
    _userToken = await _authService.userToken();

    if (_userToken == null) return;

    final userDTO = await _authService.user(_userToken!);

    if (userDTO == null) {
      await signOut();
      return;
    }

    _user = User.fromDTO(userDTO);
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    final userDTO = await _authService.verifyCredentials(email, password);

    if (userDTO == null) {
      await signOut();
      return;
    }

    _userToken = userDTO.token;
    _user = User.fromDTO(userDTO);
    notifyListeners();

    await _authService.updateUserToken(_userToken);
  }

  Future<void> signOut() async {
    _userToken = null;
    _user = null;
    notifyListeners();

    await _authService.updateUserToken(null);
  }
}
