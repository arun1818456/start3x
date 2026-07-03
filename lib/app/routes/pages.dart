import '../../exports.dart';

class AppPages {
  static List<GetPage> getPages = [

    GetPage(name: AppRoutes.homeScreen, page: () => HomePage()),
    GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.invoice, page: () => InvoiceGenerator()),

  ];
}
