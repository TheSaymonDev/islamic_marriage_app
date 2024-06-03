import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/home_screen/home_screen.dart';
import 'package:islamic_marriage/screens/onboarding_screen/onboarding_screen.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_dependency_binder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  final token = SharedPreferencesService().getToken();
  runApp( MyApp(
    screen: token.isNotEmpty ? const HomeScreen() : const HomeScreen(),
  ));
}

class MyApp extends StatelessWidget {

  final Widget? screen;
  const MyApp({super.key, this.screen});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 932),
      builder: (_, child) {
        return GetMaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: AppColors.whiteClr,
              appBarTheme: const AppBarTheme(
                  backgroundColor: AppColors.whiteClr
              )
          ),
          debugShowCheckedModeBanner: false,
          initialBinding: AppDependencyBinder(),
          home: screen,
        );
      },
    );
  }
}
