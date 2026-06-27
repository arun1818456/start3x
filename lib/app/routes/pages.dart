import 'package:get/get.dart';
import 'package:start3x/app/routes/routes.dart';
import '../../exports.dart';

class AppPages {
  static List<GetPage> getPages = [

    GetPage(name: AppRoutes.homeScreen, page: () => HomePage()),

  ];
}
