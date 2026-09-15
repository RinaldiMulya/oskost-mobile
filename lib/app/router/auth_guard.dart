import 'package:flutter/foundation.dart';

// ponytail: in-memory guard for MVP; upgrade to flutter_secure_storage + JWT refresh interceptor when /api/v1/auth ready
class AuthGuard extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _forceReset = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get forceReset => _forceReset;

  void login() {
    _isLoggedIn = true;
    _forceReset = false;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _forceReset = false;
    notifyListeners();
  }

  void requireForceReset() {
    _forceReset = true;
    notifyListeners();
  }

  void clearForceReset() {
    _forceReset = false;
    notifyListeners();
  }
}

final authGuard = AuthGuard();
