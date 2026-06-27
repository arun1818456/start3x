

import 'package:get/get.dart';
import 'package:start3x/app/routes/pages.dart';

import 'app/routes/routes.dart';
import 'exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget with BaseClass{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        keyBoardOff(context);
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.homeScreen,
        getPages: AppPages.getPages,
      ),
    );
  }
}
