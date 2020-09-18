import 'package:shared_preferences/shared_preferences.dart';
import '../index.dart';

final _preferenceKeyLoggedIn = "keyLoggedIn";
final _preferenceKeyLoginResponse = "keyLoginResponse";

class SharedPreferenceRepository {

  /// Gets shared preference instance
  Future<SharedPreferences> getSharedPrefInstance() async {
    SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance().then((value) => value);
    return sharedPreferences;
  }

  /// Saves LoggedIn status in shared preference
  saveLoggedIn(bool value) {
    AppManager.sharedPreferences.setBool(_preferenceKeyLoggedIn, value);
  }

  /// Gets LoggedIn status from shared preference
  bool isLoggedIn() {
    return AppManager.sharedPreferences.getBool(_preferenceKeyLoggedIn) ??
        false;
  }
  
  saveLoginResponse(LoginResponse value) {
    AppManager.sharedPreferences
        .setString(_preferenceKeyLoginResponse, json.encode(value));
  }

  LoginResponse getLoginResponse() {
    return json.decode(
        AppManager.sharedPreferences.getString(_preferenceKeyLoginResponse));
  }

  /// Save Int Data
  setInt(String key, int value) async {
    AppManager.sharedPreferences.setInt(key, value);
  }

  /// Get Int Data
  int getInt(String key) {
    return AppManager.sharedPreferences.getInt(key);
  }

  Future clearLoginData() async {
    SharedPreferences _prefs = AppManager.sharedPreferences;
    _prefs.remove('loginResponse');
  }
}
