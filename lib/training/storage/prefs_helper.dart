import 'package:shared_preferences/shared_preferences.dart';

// Training helper - cara pelatihan: get/set/remove langsung
// ponytail: ini untuk latihan saja, base app tetap pakai auth_guard.dart
class TrainingPrefs {
  static const _kLogin = 'training_isLoggedIn';

  static Future<void> setLogin(bool v) async {
    final p = await SharedPreferences.getInstance();
    await p.setBool(_kLogin, v);
  }

  static Future<bool> getLogin() async {
    final p = await SharedPreferences.getInstance();
    return p.getBool(_kLogin) ?? false;
  }

  static Future<void> clear() async {
    final p = await SharedPreferences.getInstance();
    await p.remove(_kLogin);
  }
}
