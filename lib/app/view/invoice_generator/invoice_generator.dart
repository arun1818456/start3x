import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start3x/app/constant/app_fonts.dart';
import 'package:start3x/app/constant/assets_images.dart';
import 'package:start3x/app/constant/colors.dart';
import 'package:start3x/app/view/invoice_generator/invoice_generator_controller.dart';
import 'package:start3x/app/widgets/text_field.dart';

import '../../widgets/button.dart';

class InvoiceGenerator extends StatefulWidget {
  const InvoiceGenerator({super.key});

  @override
  State<InvoiceGenerator> createState() => _InvoiceGeneratorState();
}

class _InvoiceGeneratorState extends State<InvoiceGenerator> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: InvoiceGeneratorController(),
      builder: (controller) => Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        appBar: AppBar(
          leading: SizedBox(),
          centerTitle: true,
          title: const Text(
            'Invoice Generator',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: AppColors.appColorOrange,
          elevation: 1,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ElevatedButton.icon(
                onPressed: controller.exportToPdf,
                icon: const Icon(
                  Icons.picture_as_pdf,
                  color: AppColors.grey2Color,
                ),
                label: const Text(
                  'Export PDF',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey2Color,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: ElevatedButton.icon(
                onPressed: controller.exportToPdf,
                icon: const Icon(
                  Icons.picture_as_pdf,
                  color: AppColors.grey2Color,
                ),
                label: const Text(
                  'Export Contract',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey2Color,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildLeftColumn(controller)),
                        const SizedBox(width: 32),
                        Expanded(child: _buildRightColumn(controller)),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _buildLeftColumn(controller),
                        const SizedBox(height: 32),
                        _buildRightColumn(controller),
                      ],
                    );
                  }
                },
              ),
            ),
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
              Text(
                'Invoice No : ${controller.invoiceNoController.text}',
                style: TextStyle(fontFamily: AppFonts.inter, fontSize: 13),
              ),
              const SizedBox(height: 16),
              MyTextFieldForm(
                controller: controller.companyNameController,
                hintText: 'Legal Business Name (Required)',
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                hintText: "+91 ",
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                  child: Image.asset(
                    AppImages.flag,
                    width: 5,
                    height: 5,
                    alignment: AlignmentGeometry.center,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                controller: controller.gstinController,
                hintText: 'Your GSTIN',
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                controller: controller.addressController,
                hintText: 'Address',
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: MyTextFieldForm(
                      hintText: 'City',
                      controller: controller.cityController,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: MyTextFieldForm(
                      hintText: 'Postal Code / ZIP Code',
                      controller: controller.zipController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                hintText: 'Email',
                controller: controller.emailController,
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                hintText: 'Website',
                controller: controller.websiteController,
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'Payment instruction',
                  style: TextStyle(
                    color: AppColors.grey2Color,
                    fontFamily: AppFonts.inter,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              MyTextFieldForm(
                hintText: 'Bank Name',
                controller: controller.bankNameController,
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                hintText: 'Account Number',
                controller: controller.accountNoController,
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                hintText: 'Account Holder\'s name',
                controller: controller.holderNameController,
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                hintText: 'Ifsc Code',
                controller: controller.ifscController,
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: CustomButton(
                  text: "Add Terms",
                  onPressed: () {},
                  color: AppColors.greyDarkColor,
                  width: Get.width * 0.08,
                  buttonHeight: 30,
                  radius: 8,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  border: Border.all(
                    color: Colors.grey.shade400,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(fontSize: 13, color: AppColors.grey2Color),
                        children: [
                          TextSpan(
                            text: 'Add business logo',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ' (PNG or JPEG) with a\nresolution up to 1080 × 1080 pixels.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  border: Border.all(
                    color: Colors.grey.shade400,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(fontSize: 13, color: AppColors.grey2Color),
                        children: [
                          TextSpan(
                            text: 'Add Stamp Png',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ' (PNG or JPEG) with a\nresolution up to 1080 × 1080 pixels.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRightColumn(InvoiceGeneratorController controller) {
    return Column(
      children: [
        _buildSection(
          title: 'Create Bill',
          child: Column(
            children: [
              MyTextFieldForm(
                hintText: 'Price / Amount',
                controller: controller.priceController,
                prefixIcon: Icon(Icons.currency_rupee,size: 18,),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: MyTextFieldForm(
                      hintText: 'Item / Product Name',
                      controller: controller.itemNameController,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: MyTextFieldForm(
                      hintText: 'Quantity',
                      controller: controller.itemNameController,
                      suffixIcon: Column(
                        children: [
                          InkWell(
                            onTap: () =>
                                setState(() => controller.quantity++),
                            child: const Icon(
                              Icons.keyboard_arrow_up,
                              size: 18,
                            ),
                          ),
                          InkWell(
                            onTap: () => setState(
                              () => controller.quantity > 1
                                  ? controller.quantity--
                                  : null,
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            MyTextFieldForm(
              hintText: 'Amount Due (Optional)',
              controller: controller.amountDueOptionalController,
              prefixIcon: Icon(Icons.currency_rupee,size: 18,),
            ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      controller.dateController.text =
                          "${picked.day}/${picked.month}/${picked.year}";
                    });
                  }
                },
                icon: const Icon(Icons.calendar_month, size: 18),
                label: const Text('Select Date Manually'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.appColorOrange,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
              ),
              const SizedBox(height: 20),
              _buildSummaryRow(
                'Subtotal:',
                '₹ ${controller.subtotal.toStringAsFixed(2)}',
              ),
              _buildSummaryRow(
                'GST (18%):',
                '₹ ${controller.gstAmount.toStringAsFixed(2)}',
              ),
              _buildSummaryRow(
                'Total:',
                '₹ ${controller.total.toStringAsFixed(2)}',
                isBold: true,
              ),
              _buildSummaryRow('Paid on:', '16 May 2026'),
              _buildSummaryRow(
                'Amount Due:',
                '₹ ${controller.total.toStringAsFixed(2)}',
              ),
              const SizedBox(height: 32),
              const Text(
                'BILL TO',
                style: TextStyle(
                  color: AppColors.grey2Color,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              MyTextFieldForm(
                hintText: 'Legal Business Name (Required)',
                controller: controller.billToNameController,
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                hintText: 'Your GSTIN',
                controller: controller.billToGstinController,
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                hintText: 'Address',
                controller: controller.billToAddressController,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: MyTextFieldForm(
                      hintText: 'City',
                      controller: controller.billToCityController,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: MyTextFieldForm(
                      hintText: 'Postal Code / ZIP Code',
                      controller: controller.billToZipController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                hintText: 'Email',
                controller: controller.billToEmailController,
              ),
              const SizedBox(height: 12),
              MyTextFieldForm(
                hintText: 'Website',
                controller: controller.billToWebsiteController,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.greyColor, // Medium grey background
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: AppFonts.inter,
              color: AppColors.grey2Color,
            ),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
