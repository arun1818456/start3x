
import '../../exports.dart';
import '../constant/app_fonts.dart';

class ProfileNameWidget extends StatelessWidget {
  const ProfileNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Arun Mehra",style: TextStyle(
          fontFamily: AppFonts.inter,
          fontSize: 16,
          color: AppColors.greyDarkColor,
        ),
        ),
        SizedBox(width: 10,),
        Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFFF6B35),
            shape: BoxShape.circle,
          ),
          child: Text("A",style: TextStyle(color: Colors.white),),
        )
      ],
    );
  }
}
