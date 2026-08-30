import '../../../../exports.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    double horizontalPadding = ResponsiveHelper.getHorizontalPadding(context);

    return GetBuilder(
      init: ProfileController(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(context, controller),
              const Divider(
                color: AppColors.greyColor,
                height: 0,
                thickness: 1,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 180,
                        alignment: isMobile ? Alignment.center : Alignment.bottomLeft,
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding + (isMobile ? 0 : 200),
                          vertical: 40,
                        ),
                        color: AppColors.appColorOrange,
                        child: Text(
                          "Arun Mehra",
                          style: TextStyle(
                            fontSize: isMobile ? 24 : 32,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.inter,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          top: 80,
                          left: horizontalPadding,
                          right: horizontalPadding,
                          bottom: 60,
                        ),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: HoverScaleWidget(
                                child: CustomButton(
                                  width: 180,
                                  text: "Save Changes",
                                  onPressed: () {},
                                  color: Colors.white,
                                  buttonHeight: 45,
                                  isBorderEnable: true,
                                  textColor: AppColors.appColorOrange,
                                  borderColor: AppColors.appColorOrange,
                                  radius: 12,
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            _buildForm(isMobile),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // Profile Image
                  Positioned(
                    top: 100,
                    left: isMobile ? (MediaQuery.of(context).size.width / 2 - 75) : horizontalPadding + 20,
                    child: Hero(
                      tag: 'profile_image',
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 8,
                            bottom: 8,
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(bool isMobile) {
    return Column(
      children: [
        _buildResponsiveRow(
          isMobile,
          [
            const ExpandedField(label: "Full Name", hint: "Enter Full Name"),
            const ExpandedField(label: "Email Id", hint: "Enter Email"),
          ],
        ),
        const SizedBox(height: 24),
        _buildResponsiveRow(
          isMobile,
          [
            const ExpandedField(label: "Mobile Number", hint: "+91 "),
            const ExpandedField(label: "City", hint: "Enter City"),
          ],
        ),
        const SizedBox(height: 24),
        _buildResponsiveRow(
          isMobile,
          [
            const ExpandedField(label: "Business Niche", hint: "Solar"),
            const ExpandedField(label: "Team Size", hint: "Enter Team Size"),
          ],
        ),
        const SizedBox(height: 24),
        _buildResponsiveRow(
          isMobile,
          [
            const ExpandedField(label: "Other Info", hint: "Solar"),
            if (!isMobile) const Spacer(),
          ],
        ),
      ],
    );
  }

  Widget _buildResponsiveRow(bool isMobile, List<Widget> children) {
    if (isMobile) {
      return Column(
        children: children
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: e,
                ))
            .toList(),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children.map((e) {
        if (e is ExpandedField) {
          return Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: e));
        }
        return e;
      }).toList(),
    );
  }

  Widget _buildHeader(BuildContext context, ProfileController controller) {
    bool isMobile = ResponsiveHelper.isMobile(context);
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.getHorizontalPadding(context),
        vertical: 15,
      ),
      child: Row(
        children: [
          const LogoTextWidget(),
          const Spacer(),
          if (!isMobile)
            const Text(
              "Profile Settings",
              style: TextStyle(
                fontFamily: AppFonts.inter,
                fontSize: 20,
                color: AppColors.greyDarkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (!isMobile) const Spacer(),
          const ProfileNameWidget(),
        ],
      ),
    );
  }
}

class ExpandedField extends StatelessWidget {
  final String label;
  final String hint;

  const ExpandedField({super.key, required this.label, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.grey2Color,
            fontFamily: AppFonts.inter,
          ),
        ),
        const SizedBox(height: 8),
        MyTextFieldForm(
          hintText: hint,
          borderColor: AppColors.grey3Color,
          fillColor: Colors.white,
        ),
      ],
    );
  }
}
