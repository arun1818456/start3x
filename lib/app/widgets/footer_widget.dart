
import '../../exports.dart';
import 'logo_text_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.grey[700],thickness: 0.3,height: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LogoTextWidget(),
                  const SizedBox(height: 16),
                  const Text(
                    'Reduce your effort, get direct client visits,\n'
                        'and work smoothly with full clarity and zero\n'
                        'stress.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFooterColumn('Product', [
                    'Home',
                    'About',
                    'Pricing',
                    'Plans',
                  ]),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFooterColumn('Company', [
                    'About',
                    'Contact',
                    'Blog',
                    'Careers',
                  ]),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildFooterColumn('Legal', [
                    'Privacy Policy',
                    'Terms & Conditions',
                    'Cookie Policy',
                  ]),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Divider(color: Colors.grey[700]),
          const SizedBox(height: 20),
          const Text(
            '© 2026 Start3x. All rights reserved. GSTIN: 18EKHPM0377M1ZL',
            style: TextStyle(fontSize: 14, color: AppColors.greyDarkColor),
          ),
        ],
      ),
    );
  }
  Widget _buildFooterColumn(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.greyDarkColor,
          ),
        ),
        const SizedBox(height: 16),
        ...items.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.greyDarkColor,
              ),
            ),
          );
        }),
      ],
    );
  }
}
