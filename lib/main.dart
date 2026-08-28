import 'package:start3x/app/routes/pages.dart';
import 'exports.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget with BaseClass{
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        keyBoardOff();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.initialRoute,
        getPages: AppPages.getPages,
      ),
    );
  }
}
