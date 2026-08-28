import '../../../../../exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          body: LoginSignupUiWidget(
            onTap: () {
              controller.onTapLoginButton();
            },
            type: "login",
            emailController: controller.emailController,
            passwordController: controller.passwordController,
          ),
        );
      },
    );
  }
}
