import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  getPreferences() async => await SharedPreferences.getInstance();

  Future<void> saveToken(String token) async {
    SharedPreferences pref = await getPreferences();
    pref.setString('token', token);
    return null;
  }

  Future<String> getToken() async {
    SharedPreferences pref = await getPreferences();
    return pref.getString('token');
  }

  Future<void> clear() async {
    SharedPreferences pref = await getPreferences();
    await pref.clear();
  }
}
