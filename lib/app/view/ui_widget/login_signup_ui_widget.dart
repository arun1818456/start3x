import 'package:flutter/gestures.dart';
import '../../../exports.dart';

class LoginSignupUiWidget extends StatefulWidget {
  final String type; // "login" or "signup"
  final Function onTap;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;

  const LoginSignupUiWidget({
    super.key,
    required this.type,
    required this.onTap,
    required this.emailController,
    required this.passwordController,
    this.confirmPasswordController,
  });

  @override
  State<LoginSignupUiWidget> createState() => _LoginSignupUiWidgetState();
}

class _LoginSignupUiWidgetState extends State<LoginSignupUiWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.appLogo,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 30), // Use SizedBox for gaps
            _buildFormContainer(),
          ],
        ),
      ),
    );
  }

  /// Builds the form container for login or signup
  Widget _buildFormContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.fadeColor,
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          _buildHeader(),
          const SizedBox(height: 15),
          _buildEmailField(),
          const SizedBox(height: 15),
          _buildPasswordField(),
          const SizedBox(height: 15),
          if (widget.type == "signup") _buildConfirmPasswordField(),
          const SizedBox(height: 15),
          _buildActionButton(),
          if (widget.type == "signup") SizedBox(height: 15),
          if (widget.type == "login") _buildForgotPasswordButton(),
          _buildDivider(),
          const SizedBox(height: 10),
          _buildGoogleSignInButton(),
          const SizedBox(height: 15),
          _buildSignInPrompt(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  /// Builds the header (Login or Sign Up)
  Widget _buildHeader() {
    return Text(
      widget.type == "login" ? "Login" : "Sign Up",
      style: TextStyle(fontSize: 20, color: AppColors.blueColor),
    );
  }

  /// Builds the email text field
  Widget _buildEmailField() {
    return MyTextFieldForm(
      keyboardType: TextInputType.emailAddress,
      controller: widget.emailController,
      hintText: "Email",
      prefixIcon: Icon(Icons.person),
    );
  }

  /// Builds the password text field
  Widget _buildPasswordField() {
    return MyTextFieldForm(
      keyboardType: TextInputType.visiblePassword,
      controller: widget.passwordController,
      hintText: "Password",
      prefixIcon: Icon( Icons.lock),
      isPassword: true,
    );
  }

  /// Builds the Confirm password text field
  Widget _buildConfirmPasswordField() {
    return MyTextFieldForm(
      keyboardType: TextInputType.visiblePassword,
      controller: widget.confirmPasswordController,
      hintText: "Confirm Password",
      prefixIcon: Icon( Icons.lock),
      isPassword: true,
    );
  }

  /// Builds the action button (Login/Sign Up)
  Widget _buildActionButton() {
    return CustomButton(
      onPressed: () => widget.onTap(),
      text: widget.type == "login"
          ? "Login"
          : "Sign Up", // Change text based on type
      color: AppColors.blueColor,
      textColor: AppColors.whiteColor,
    );
  }

  /// Builds the "Forgot Password" button
  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Get.toNamed(AppRoutes.forgetPasswordScreen);
        },
        child: const Text(
          "Forget Password",
          style: TextStyle(color: AppColors.blackColor),
        ),
      ),
    );
  }

  /// Builds the divider with "or" text
  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Expanded(child: Divider(color: AppColors.blackColor)),
          Text("   or   "),
          Expanded(child: Divider(color: AppColors.blackColor)),
        ],
      ),
    );
  }

  /// Builds the Google Sign In button
  Widget _buildGoogleSignInButton() {
    return CustomButton(
      onPressed: () async {
        // var login=Get.put(LoginController());
        // var signup=Get.put(SignUpController());
        // login.setLoading(true);
        // signup.setLoading(true);
        // await googleSign(); // Call your Google sign-in method
        // login.setLoading(false);
        // signup.setLoading(false);
      },
      text: "",
      buttonCenter: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.googleLogo,
            height: 30,
            width: 30,
          ),
          const SizedBox(width: 10),
          Text(
            "${widget.type == "login" ? "Sign in" : "Sign Up"} with Google",
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ],
      ),
      color: AppColors.blackColor,
      textColor: AppColors.whiteColor,
    );
  }

  /// Builds the sign-in prompt
  Widget _buildSignInPrompt() {
    return RichText(
      text: TextSpan(
        text: widget.type == "login"
            ? "Don't have an account? "
            : "Already have an account ?  ",
        style: TextStyle(fontSize: 16),
        children: [
          TextSpan(
            text: widget.type == "login" ? "Sign in" : "Login",
            style: const TextStyle(
              color: AppColors.blueColor,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                widget.type == "login"
                    ? Get.toNamed(AppRoutes.signUpScreen)
                    : Get.back();
              },
          ),
        ],
      ),
    );
  }
}
