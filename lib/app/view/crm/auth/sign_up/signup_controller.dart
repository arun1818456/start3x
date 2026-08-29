
import 'package:start3x/app/constant/api_constant.dart';
import 'package:start3x/app/constant/local_keys.dart';
import 'package:start3x/app/constant/validations.dart';
import 'package:start3x/app/services/api_handler.dart';
import '../../../../../exports.dart';

class SignUpController extends GetxController  with BaseClass{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Observable loading state
  bool loading = false;

  // Method to handle sign-up action
  Future<void> onSignUpTap() async {
    if (Validation().signUp(
        email: emailController.text.trim(),
        confirm: confirmController.text.trim(),
        password: passwordController.text.trim())) {
      keyBoardOff();

      try {

        var res = await  httpRequest(REQUEST.post, createUserApiEP, {
          "email":emailController.text.trim(),
          "password":passwordController.text.trim()
        });
      storage.write(LocalKeys.userData,res["userData"]);
      if(res["success"]){

      }
      }  catch (e) {
       showMySnackBar(e.toString(),error: true);
      } finally {
      }
    }
  }

}
