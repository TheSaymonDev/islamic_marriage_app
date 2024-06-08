import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_pages.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().init();
  final token = SharedPreferencesService().getToken();
  runApp(MyApp(
      initialRoute: token.isNotEmpty ? AppRoutes.homeScreen : AppRoutes.onboardingScreen));
}

class MyApp extends StatelessWidget {
  final String? initialRoute;
  const MyApp({super.key,  this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 932),
      builder: (_, __) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.whiteClr,
            appBarTheme: const AppBarTheme(backgroundColor: AppColors.whiteClr),
          ),
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          initialRoute: initialRoute,
        );
      },
    );
  }
}
