import 'package:flutter/foundation.dart';
import 'package:start3x/app/view/crm/auth/login/login.dart';
import 'package:start3x/app/view/crm/auth/splash/splash_screen.dart';
import '../../exports.dart';

class AppPages {
  static const initialRoute = kIsWeb
      ? AppRoutes.webHomeScreen
      : AppRoutes.splashScreen;
  static List<GetPage> getPages = [
    GetPage(name: AppRoutes.webHomeScreen, page: () => WebHomeScreen()),
    GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.invoice, page: () => InvoiceGenerator()),
    GetPage(name: AppRoutes.signUpScreen, page: () => SignUpScreen()),
    GetPage(name: AppRoutes.splashScreen, page: () => SplashScreen()),
    GetPage(name: AppRoutes.loginScreen, page: () => LoginScreen()),
  ];
}
