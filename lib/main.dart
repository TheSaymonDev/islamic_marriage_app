import 'package:flutter/material.dart';
import 'package:islamic_marriage/app.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  final token = SharedPreferencesService().getToken();
  final hasInternet = await ConnectivityService.isConnected();
  runApp(
    MyApp(
      initialRoute: hasInternet
          ? (token.isNotEmpty
          ? AppRoutes.homeScreen
          : AppRoutes.onboardingScreen)
          : AppRoutes.noInternetScreen,
    ),
  );
}
