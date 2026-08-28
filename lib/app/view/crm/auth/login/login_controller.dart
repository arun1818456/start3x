import '../../../../../exports.dart';

class LoginController extends GetxController {
  // Controllers for email and password inputs
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Firebase instances
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable loading state
  bool loading = false;
  /*---------------[ On Tap Buttons ----------------------------------------------------------------------------------------------*/
  // Method to handle login button tap
  Future<void> onTapLoginButton() async {
    // Validate email and password
    // if (Validation().login(
    //   email: emailController.text,
    //   password: passwordController.text,
    // )) {
    //   keyBoardOff();
    //   setLoading(true);
    //
    //   try {
    //     // Sign in using Firebase
    //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
    //       email: emailController.text.trim(),
    //       password: passwordController.text.trim(),
    //     );
    //
    //     // Fetch user document from Firestore
    //     var userDoc = await _firestore
    //         .collection('users')
    //         .doc(userCredential.user?.uid)
    //         .get();
    //     print(userDoc);
    //     // Check if user document exists
    //     if (userDoc.exists) {
    //       Map<String, dynamic> userData = userDoc.data()!;
    //       tokenUpdate(userData["uid"]);
    //
    //       await LocalStorage().saveUserData(UserDataModel.fromJson(userData));
    //
    //       // Navigate to the next screen
    //       checkingRoute(
    //         subscriptionMode: userDoc["subscription_mode"],
    //         newUser: userDoc["new_user"],
    //         userType: userDoc["user_type"] == ""
    //             ? "not_selected"
    //             : userDoc["user_type"],
    //       );
    //     } else {
    //       Message().toast("Please Contact Support", alert: true);
    //     }
    //   } on FirebaseAuthException catch (e) {
    //     FirebaseErrorHandler.showError(e);
    //   } catch (e) {
    //     FirebaseErrorHandler.showError(e);
    //   } finally {
    //     setLoading(false);
    //   }
    // }
  }

  // Private method to set loading state
  void setLoading(bool value) {
    loading = value;
    update();
  }
}
