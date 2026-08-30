import '../../../../exports.dart';

class InvoiceGenerator extends StatefulWidget {
  const InvoiceGenerator({super.key});

  @override
  State<InvoiceGenerator> createState() => _InvoiceGeneratorState();
}

class _InvoiceGeneratorState extends State<InvoiceGenerator> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveHelper.isMobile(context);

    return GetBuilder(
      init: InvoiceGeneratorController(),
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          backgroundColor: AppColors.appColorOrange,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Get.back(),
          ),
          title: const Text(
            'Invoice Generator',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontFamily: AppFonts.inter),
          ),
          actions: [
            _buildActionButtons(controller, isMobile),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.getHorizontalPadding(context),
            vertical: 40,
          ),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: isMobile 
                ? Column(
                    children: [
                      _buildLeftColumn(controller),
                      const SizedBox(height: 40),
                      _buildRightColumn(controller),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 1, child: _buildLeftColumn(controller)),
                      const SizedBox(width: 40),
                      Expanded(flex: 1, child: _buildRightColumn(controller)),
                    ],
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(InvoiceGeneratorController controller, bool isMobile) {
    return Row(
      children: [
        _buildHeaderAction(
          onPressed: controller.exportToPdf,
          icon: Icons.picture_as_pdf,
          label: isMobile ? '' : 'Invoice',
        ),
        _buildHeaderAction(
          onPressed: controller.exportAgreement,
          icon: Icons.description,
          label: isMobile ? '' : 'Contract',
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Widget _buildHeaderAction({required VoidCallback onPressed, required IconData icon, required String label}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: HoverScaleWidget(
        scale: 1.1,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, size: 18, color: AppColors.appColorOrange),
          label: label.isEmpty ? const SizedBox.shrink() : Text(label, style: const TextStyle(color: AppColors.appColorOrange, fontWeight: FontWeight.bold)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.symmetric(horizontal: label.isEmpty ? 12 : 16),
          ),
        ),
      ),
    );
  }

  Widget _buildLeftColumn(InvoiceGeneratorController controller) {
    return Column(
      children: [
        _buildSection(
          title: 'Our Company Details',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(color: AppColors.appColorOrange.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6)),
                child: Text(
                  'Invoice No : ${controller.invoiceNoController.text}',
                  style: const TextStyle(fontFamily: AppFonts.inter, fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.appColorOrange),
                ),
              ),
              const SizedBox(height: 24),
              const FieldLabel(label: "Company Name"),
              MyTextFieldForm(controller: controller.companyNameController, hintText: 'Legal Business Name'),
              const SizedBox(height: 16),
              const FieldLabel(label: "Mobile Number"),
              MyTextFieldForm(
                hintText: "+91 ",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Image.asset(AppImages.flag, width: 24),
                ),
              ),
              const SizedBox(height: 16),
              const FieldLabel(label: "GSTIN"),
              MyTextFieldForm(controller: controller.gstinController, hintText: 'Your GSTIN'),
              const SizedBox(height: 16),
              const FieldLabel(label: "Address"),
              MyTextFieldForm(controller: controller.addressController, hintText: 'Full Address'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const FieldLabel(label: "City"), MyTextFieldForm(hintText: 'City', controller: controller.cityController)])),
                  const SizedBox(width: 16),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const FieldLabel(label: "Zip Code"), MyTextFieldForm(hintText: 'ZIP Code', controller: controller.zipController)])),
                ],
              ),
              const SizedBox(height: 16),
              const FieldLabel(label: "Email Address"),
              MyTextFieldForm(hintText: 'Email', controller: controller.emailController),
              const SizedBox(height: 16),
              const FieldLabel(label: "Website"),
              MyTextFieldForm(hintText: 'Website (Optional)', controller: controller.websiteController),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 24),
              const Center(child: Text('Payment Instructions', style: TextStyle(color: AppColors.grey2Color, fontWeight: FontWeight.bold, fontSize: 16))),
              const SizedBox(height: 24),
              MyTextFieldForm(hintText: 'Bank Name', controller: controller.bankNameController),
              const SizedBox(height: 12),
              MyTextFieldForm(hintText: 'Account Number', controller: controller.accountNoController),
              const SizedBox(height: 12),
              MyTextFieldForm(hintText: 'Account Holder\'s Name', controller: controller.holderNameController),
              const SizedBox(height: 12),
              MyTextFieldForm(hintText: 'IFSC Code', controller: controller.ifscController),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildLogoUploads(),
      ],
    );
  }

  Widget _buildLogoUploads() {
    return Row(
      children: [
        Expanded(child: _buildUploadCard('Add Business Logo', 'PNG or JPEG, up to 1080px')),
        const SizedBox(width: 16),
        Expanded(child: _buildUploadCard('Add Stamp PNG', 'PNG or JPEG, up to 1080px')),
      ],
    );
  }

  Widget _buildUploadCard(String title, String subtitle) {
    return HoverScaleWidget(
      scale: 1.02,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const Icon(Icons.cloud_upload_outlined, color: AppColors.appColorOrange, size: 32),
            const SizedBox(height: 12),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            const SizedBox(height: 4),
            Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildRightColumn(InvoiceGeneratorController controller) {
    return Column(
      children: [
        _buildSection(
          title: 'Invoice Details',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FieldLabel(label: "Price / Amount"),
              MyTextFieldForm(hintText: '0.00', controller: controller.priceController, prefixIcon: const Icon(Icons.currency_rupee, size: 18)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const FieldLabel(label: "Product Name"), MyTextFieldForm(hintText: 'Item Name', controller: controller.itemNameController)])),
                  const SizedBox(width: 16),
                  Expanded(flex: 2, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const FieldLabel(label: "Qty"), _buildQuantityField(controller)])),
                ],
              ),
              const SizedBox(height: 16),
              const FieldLabel(label: "Amount Due (Optional)"),
              MyTextFieldForm(hintText: '0.00', controller: controller.amountDueOptionalController, prefixIcon: const Icon(Icons.currency_rupee, size: 18), onChanged: (_) => controller.update()),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Select Date',
                onPressed: () => _selectDate(controller),
                color: AppColors.greyDarkColor,
                buttonHeight: 45,
                radius: 8,
              ),
              const SizedBox(height: 32),
              _buildSummary(controller),
              const SizedBox(height: 40),
              const Divider(),
              const SizedBox(height: 32),
              const Text('BILL TO', style: TextStyle(color: AppColors.grey2Color, fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 24),
              MyTextFieldForm(hintText: 'Client Business Name', controller: controller.billToNameController),
              const SizedBox(height: 12),
              MyTextFieldForm(hintText: 'Client GSTIN', controller: controller.billToGstinController),
              const SizedBox(height: 12),
              MyTextFieldForm(hintText: 'Client Address', controller: controller.billToAddressController),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: MyTextFieldForm(hintText: 'City', controller: controller.billToCityController)),
                  const SizedBox(width: 12),
                  Expanded(child: MyTextFieldForm(hintText: 'ZIP Code', controller: controller.billToZipController)),
                ],
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  text: controller.addTermsEnabled ? "Hide Terms" : "Add Contract Terms",
                  onPressed: () {
                    controller.addTermsEnabled = !controller.addTermsEnabled;
                    controller.update();
                  },
                  color: AppColors.appColorOrange.withValues(alpha: 0.1),
                  textColor: AppColors.appColorOrange,
                  width: 200,
                  buttonHeight: 40,
                  radius: 8,
                ),
              ),
              if (controller.addTermsEnabled) ...[
                const SizedBox(height: 16),
                MyTextFieldForm(hintText: 'Services Description', controller: controller.services, minLines: 3, maxLine: 10),
                const SizedBox(height: 16),
                MyTextFieldForm(hintText: 'Terms of Service', controller: controller.termsServices, minLines: 3, maxLine: 10),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityField(InvoiceGeneratorController controller) {
    return MyTextFieldForm(
      keyboardType: TextInputType.number,
      hintText: '1',
      controller: TextEditingController(text: controller.quantity.toString()),
      suffixIcon: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(onTap: () => setState(() => controller.quantity++), child: const Icon(Icons.keyboard_arrow_up, size: 18)),
          InkWell(onTap: () => setState(() => controller.quantity > 1 ? controller.quantity-- : null), child: const Icon(Icons.keyboard_arrow_down, size: 18)),
        ],
      ),
    );
  }

  Widget _buildSummary(InvoiceGeneratorController controller) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.shade100)),
      child: Column(
        children: [
          _buildSummaryRow('Subtotal', '₹ ${controller.subtotal.toStringAsFixed(2)}'),
          _buildSummaryRow('GST (18%)', '₹ ${controller.gstAmount.toStringAsFixed(2)}'),
          const Divider(height: 24),
          _buildSummaryRow('Total', '₹ ${controller.total.toStringAsFixed(2)}', isBold: true),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 20, offset: const Offset(0, 10))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: AppFonts.inter, color: AppColors.greyDarkColor)),
          const SizedBox(height: 32),
          child,
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 15, fontWeight: isBold ? FontWeight.bold : FontWeight.w500, color: isBold ? AppColors.greyDarkColor : Colors.grey.shade600)),
          Text(value, style: TextStyle(fontSize: 15, fontWeight: isBold ? FontWeight.bold : FontWeight.w500, color: isBold ? AppColors.appColorOrange : AppColors.greyDarkColor)),
        ],
      ),
    );
  }

  Future<void> _selectDate(InvoiceGeneratorController controller) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        controller.dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }
}

class FieldLabel extends StatelessWidget {
  final String label;
  const FieldLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4),
      child: Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.grey2Color)),
    );
  }
}
