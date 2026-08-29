import 'package:flutter/services.dart';
import 'package:start3x/app/view/crm/auth/pass_key/pass_key_controller.dart';
import '../../../../../exports.dart';

class PassKeyScreen extends StatefulWidget {
  const PassKeyScreen({super.key});

  @override
  State<PassKeyScreen> createState() => _PassKeyScreenState();
}

class _PassKeyScreenState extends State<PassKeyScreen> {
  final controller = Get.put(PassKeyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildPassKeyContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPassKeyContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.fadeColor,
      ),
      child: Column(
        children: [
          SizedBox(height: 15),
          _buildLogo(),
          _buildPassKeyInput(),
          _buildSubmitButton(),
          _buildDivider(),
          _buildNoPasskeyButton(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      AppImages.appLogo,
      height: 100,
      width: 100,
    );
  }

  Widget _buildPassKeyInput() {
    return MyTextFieldForm(
      keyboardType: TextInputType.number,
      controller: controller.passController,
      hintText: "Enter Passkey",
      inputFormatters: [LengthLimitingTextInputFormatter(7)],

      onChanged: (v) {
        if (controller.passController.text.length == 7) {
          controller.keyBoardOff();
        }
      },
     margin: EdgeInsets.symmetric(horizontal: 15),
      prefixIcon: Icon(Icons.lock),
    );
  }

  Widget _buildSubmitButton() {
    return CustomButton(
      onPressed: () {
        controller.onTapSubmittedButton();
      },
      margin: EdgeInsets.symmetric(horizontal: 15),
      text: "Submit",
      color: AppColors.blueColor,
      textColor: AppColors.whiteColor,
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Divider(color: AppColors.blackColor),
          ),
          Text("   or   "),
          Expanded(
            child: Divider(color: AppColors.blackColor),
          ),
        ],
      ),
    );
  }

  Widget _buildNoPasskeyButton() {
    return CustomButton(
      onPressed: () {
        // LocalStorage().deleteAdminData();
        // Get.toNamed(AppRoutes.detailsScreen);
      },
      margin: EdgeInsets.symmetric(horizontal: 15),
      text: "I don't have passkey",
      color: AppColors.blackColor,
      textColor: AppColors.whiteColor,
    );
  }
}
