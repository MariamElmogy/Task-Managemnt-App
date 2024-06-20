import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSingleton {
  static final SharedPrefSingleton _instance = SharedPrefSingleton._internal();
  factory SharedPrefSingleton() => _instance;
  SharedPrefSingleton._internal();
  late SharedPreferences _pref;
  Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
  }

  Future<bool> setToken(String token) => _pref.setString(kTokenKey, token);
  String get token => _pref.getString(kTokenKey) ?? '';

  Future<bool> setUsername(String username) =>
      _pref.setString(kUsernameKey, username);
  String get username => _pref.getString(kUsernameKey) ?? '';

  Future<bool> setIsLogged(bool isLogged) => _pref.setBool(kIsLogged, isLogged);
  bool get isLogged => _pref.getBool(kIsLogged) ?? false;

  Future<bool> setUserId(int userId) => _pref.setInt(kUserId, userId);
  int get userId => _pref.getInt(kUserId) ?? 0;
}

const kTokenKey = 'kToken';
const kUsernameKey = 'kUsernameKey';
const kIsLogged = 'kIsLogged';
const kUserId = 'kUserId';
