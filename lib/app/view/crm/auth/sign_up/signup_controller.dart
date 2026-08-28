
import 'package:start3x/app/constant/validations.dart';

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
        // // Create user with email and password
        // UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        //   email: emailController.text.trim(),
        //   password: passwordController.text.trim(),
        // );
        //
        // // Create new user in Firestore
        // await createNewUser(
        //   provider: "gmail",
        //   uid: userCredential.user!.uid,
        //   email: userCredential.user!.email.toString(),
        //   emailVerified: userCredential.user!.emailVerified,
        //   photoURL: "",
        //   name: "",
        // );
        //
        // // Navigate to the next screen
        // Get.offAllNamed(AppRoutes.passKeyScreen);
      }  catch (e) {
        // Handle any other exceptions
       showMySnackBar(e.toString(),error: true);
      } finally {
      }
    }
  }

}
