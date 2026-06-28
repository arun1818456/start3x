import 'package:get/get.dart';
import 'package:start3x/app/routes/routes.dart';
import 'package:start3x/app/view/profile/profile_screen.dart';
import '../../exports.dart';
import '../view/invoice_generator/invoice_generator.dart';

class AppPages {
  static List<GetPage> getPages = [

    GetPage(name: AppRoutes.homeScreen, page: () => HomePage()),
    GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.invoice, page: () => InvoiceGenerator()),

  ];
}
