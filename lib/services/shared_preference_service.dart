import 'package:shared_preferences/shared_preferences.dart';
class SharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();
  factory SharedPreferencesService() => _instance;
  SharedPreferencesService._internal();
  late SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void saveUserData(Map<String, dynamic> userData) {
    _prefs.setString('token', userData['data'] ?? '');
  }
  String getUserId(){
    return _prefs.getString('userId') ?? '';
  }

  String getToken() {
    return _prefs.getString('token') ?? '';
  }

  String getUserName(){
    return _prefs.getString('name') ?? '';
  }

  String getUserEmail(){
    return _prefs.getString('email') ?? '';
  }

  String getUserMobileNumber(){
    return _prefs.getString('mobileNumber') ?? '';
  }

  void saveScreen(bool homeScreen){
    _prefs.setBool('showHome', homeScreen);
  }
  bool getSavedScreen(){
    return _prefs.getBool('showHome') ?? false;
  }

  void clearUserData() {
    _prefs.remove('token');
  }

  void saveTheme(String theme) {
    _prefs.setString('themeKey', theme);
  }

  String getTheme() {
    return _prefs.getString('themeKey') ?? '';
  }

  void saveLanguage(String language) {
    _prefs.setString('languageKey', language);
  }

  String getLanguage() {
    return _prefs.getString('languageKey') ?? '';
  }


}