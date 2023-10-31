import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_app/core/storage/storage_key.dart';

class TokenStorage {

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(StorageKey.token, token);
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? token = prefs.getString(StorageKey.token);

    return token ?? '';
  }

  Future<void> saveRefreshToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(StorageKey.refreshToken, token);
  }

  Future<String> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? token = prefs.getString(StorageKey.refreshToken);

    return token ?? '';
  }

  Future<void> updateToken(String token) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageKey.token);
    await prefs.setString(StorageKey.token,token);
  }

  Future<void> removeTokens() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(StorageKey.token);
    await prefs.remove(StorageKey.refreshToken);
  }
}
