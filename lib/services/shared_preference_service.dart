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
    _prefs.setString('userId', userData['user']['id'] ?? '');
    _prefs.setString('name', userData['user']['fullName'] ?? '');
    _prefs.setString('email', userData['user']['email'] ?? '');
    _prefs.setString('gender', userData['user']['gender'] ?? '');
    _prefs.setString('mobileNumber', userData['user']['mobileNumber'] ?? '');
    _prefs.setString('refreshToken', userData['user']['refreshToken'] ?? '');
    _prefs.setString('accessToken', userData['accessToken'] ?? '');
  }
  String getUserId(){
    return _prefs.getString('userId') ?? '';
  }

  String getToken() {
    return _prefs.getString('accessToken') ?? '';
  }

  void saveScreen(bool homeScreen){
    _prefs.setBool('showHome', homeScreen);
  }
  bool getSavedScreen(){
    return _prefs.getBool('showHome') ?? false;
  }

  void clearUserData() {
    _prefs.remove('userId');
    _prefs.remove('name');
    _prefs.remove('email');
    _prefs.remove('gender');
    _prefs.remove('mobileNumber');
    _prefs.remove('refreshToken');
    _prefs.remove('accessToken');
  }
}