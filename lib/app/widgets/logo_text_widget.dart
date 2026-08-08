import '../../exports.dart';

class LogoTextWidget extends StatelessWidget {
  const LogoTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.fullLogo,height: 51,width: 100,);
  }
}
