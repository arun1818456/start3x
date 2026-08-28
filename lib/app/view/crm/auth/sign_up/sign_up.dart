import '../../../../../exports.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SignUpController(),
      builder: (SignUpController controller) {
        return Scaffold(
          body: LoginSignupUiWidget(
            type: "signup",
            emailController: controller.emailController,
            passwordController: controller.passwordController,
            confirmPasswordController: controller.confirmController,
            onTap: () {
              controller.onSignUpTap();
            },
          ),
        );
      },
    );
  }
}
