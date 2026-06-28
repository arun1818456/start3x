import 'package:start3x/app/constant/app_fonts.dart';
import '../../exports.dart';

class LogoTextWidget extends StatelessWidget {
  const LogoTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFFFF6B35),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'S3',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: AppFonts.inter,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Start',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.greyDarkColor,
                  fontFamily: AppFonts.inter,
                ),
              ),
              TextSpan(
                text: '3x',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.appColorOrange,
                  fontFamily: AppFonts.inter,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
