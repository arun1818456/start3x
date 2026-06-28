import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class InvoiceGenerator extends StatefulWidget {
  const InvoiceGenerator({super.key});

  @override
  State<InvoiceGenerator> createState() => _InvoiceGeneratorState();
}

class _InvoiceGeneratorState extends State<InvoiceGenerator> {
  // Company Details
  final TextEditingController _invoiceNoController = TextEditingController(text: 'SME001');
  final TextEditingController _dateController = TextEditingController(text: '0/0/0');
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _gstinController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();

  // Payment Instruction
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _accountNoController = TextEditingController();
  final TextEditingController _holderNameController = TextEditingController();
  final TextEditingController _ifscController = TextEditingController();

  // Create Bill
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();
  int _quantity = 1;
  final TextEditingController _amountDueOptionalController = TextEditingController();
  bool _isAmountDueEnabled = false;

  // Bill To
  final TextEditingController _billToNameController = TextEditingController();
  final TextEditingController _billToGstinController = TextEditingController();
  final TextEditingController _billToAddressController = TextEditingController();
  final TextEditingController _billToCityController = TextEditingController();
  final TextEditingController _billToZipController = TextEditingController();
  final TextEditingController _billToEmailController = TextEditingController();
  final TextEditingController _billToWebsiteController = TextEditingController();

  // Calculations
  double get _subtotal {
    double price = double.tryParse(_priceController.text) ?? 0.0;
    return price * _quantity;
  }
  double get _gstAmount => _subtotal * 0.18;
  double get _total => _subtotal + _gstAmount;

  Future<void> _exportToPdf() async {
    final pdf = pw.Document();

    // Helper to handle empty strings
    String _f(String? text) => (text == null || text.trim().isEmpty) ? '---' : text;

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(
                level: 0,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text('INVOICE', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold, color: PdfColors.blue)),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        pw.Text('Invoice No: ${_f(_invoiceNoController.text)}'),
                        pw.Text('Date: ${_f(_dateController.text)}'),
                      ],
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('FROM:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text(_f(_companyNameController.text)),
                        pw.Text(_f(_phoneController.text)),
                        pw.Text('GSTIN: ${_f(_gstinController.text)}'),
                        pw.Text(_f(_addressController.text)),
                        pw.Text('${_f(_cityController.text)}, ${_f(_zipController.text)}'),
                        pw.Text(_f(_emailController.text)),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 50),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('BILL TO:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text(_f(_billToNameController.text)),
                        pw.Text('GSTIN: ${_f(_billToGstinController.text)}'),
                        pw.Text(_f(_billToAddressController.text)),
                        pw.Text('${_f(_billToCityController.text)}, ${_f(_billToZipController.text)}'),
                        pw.Text(_f(_billToEmailController.text)),
                      ],
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 30),
              pw.TableHelper.fromTextArray(
                headers: ['Item Description', 'Quantity', 'Price', 'Total'],
                data: [
                  [
                    _f(_itemNameController.text),
                    _quantity.toString(),
                    'Rs. ${_priceController.text.isEmpty ? '0' : _priceController.text}',
                    'Rs. ${_subtotal.toStringAsFixed(2)}'
                  ],
                ],
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColors.white),
                headerDecoration: const pw.BoxDecoration(color: PdfColors.blueGrey),
                cellHeight: 30,
                cellAlignments: {
                  0: pw.Alignment.centerLeft,
                  1: pw.Alignment.center,
                  2: pw.Alignment.centerRight,
                  3: pw.Alignment.centerRight,
                },
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.end,
                    children: [
                      pw.Text('Subtotal: Rs. ${_subtotal.toStringAsFixed(2)}'),
                      pw.Text('GST (18%): Rs. ${_gstAmount.toStringAsFixed(2)}'),
                      pw.Divider(color: PdfColors.grey),
                      pw.Text('Total: Rs. ${_total.toStringAsFixed(2)}',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                      pw.SizedBox(height: 5),
                      pw.Text('Amount Due: Rs. ${_total.toStringAsFixed(2)}',
                          style: pw.TextStyle(color: PdfColors.red)),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 40),
              pw.Divider(color: PdfColors.grey300),
              pw.Text('Payment Instructions:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('Bank: ${_f(_bankNameController.text)}'),
              pw.Text('A/C No: ${_f(_accountNoController.text)}'),
              pw.Text('Name: ${_f(_holderNameController.text)}'),
              pw.Text('IFSC: ${_f(_ifscController.text)}'),
              pw.Spacer(),
              pw.Center(
                child: pw.Text('Thank you for your business!', style: pw.TextStyle(fontStyle: pw.FontStyle.italic, color: PdfColors.grey700)),
              ),
            ],
          );
        },
      ),
    );

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save(),
        name: 'Invoice_${_invoiceNoController.text.isEmpty ? "New" : _invoiceNoController.text}.pdf'
    );
  }

  @override
  void initState() {
    super.initState();
    _priceController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Invoice Generator', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton.icon(
              onPressed: _exportToPdf,
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text('Export PDF'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
                      Expanded(child: _buildLeftColumn()),
                      const SizedBox(width: 32),
                      Expanded(child: _buildRightColumn()),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      _buildLeftColumn(),
                      const SizedBox(height: 32),
                      _buildRightColumn(),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      children: [
        _buildSection(
          title: 'Our Company Details',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Invoice No : ${_invoiceNoController.text}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  InkWell(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (picked != null) {
                        setState(() {
                          _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
                        });
                      }
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month, size: 16, color: Colors.black54),
                        const SizedBox(width: 4),
                        Text('Date: ${_dateController.text}', style: const TextStyle(fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField(hint: 'Legal Business Name (Required)', controller: _companyNameController),
              const SizedBox(height: 12),
              _buildPhoneField(),
              const SizedBox(height: 12),
              _buildTextField(hint: 'Your GSTIN', controller: _gstinController),
              const SizedBox(height: 12),
              _buildTextField(hint: 'Address', controller: _addressController),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildTextField(hint: 'City', controller: _cityController)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildTextField(hint: 'Postal Code / ZIP Code', controller: _zipController)),
                ],
              ),
              const SizedBox(height: 12),
              _buildTextField(hint: 'Email/Number', controller: _emailController),
              const SizedBox(height: 12),
              _buildTextField(hint: 'Website', controller: _websiteController),
              const SizedBox(height: 24),
              const Center(child: Text('Payment instruction',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16))),
              const SizedBox(height: 16),
              _buildTextField(hint: 'Bank Name', controller: _bankNameController),
              const SizedBox(height: 12),
              _buildTextField(hint: 'Account Number', controller: _accountNoController),
              const SizedBox(height: 12),
              _buildTextField(hint: 'Account Holder\'s name', controller: _holderNameController),
              const SizedBox(height: 12),
              _buildTextField(hint: 'Ifsc Code', controller: _ifscController),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            children: [
              const Text(
                'Add business logo (PNG or JPEG) with a\nresolution up to 1080 × 1080 pixels.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRightColumn() {
    return Column(
      children: [
        _buildSection(
          title: 'Create Bill',
          child: Column(
            children: [
              _buildTextField(hint: 'Price / Amount', controller: _priceController, prefix: '₹ '),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(flex: 2, child: _buildTextField(hint: 'Item / Product Name', controller: _itemNameController)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        children: [
                          const Text('Quantity', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () => setState(() => _quantity++),
                                  child: const Icon(Icons.keyboard_arrow_up, size: 18)
                              ),
                              InkWell(
                                  onTap: () => setState(() => _quantity > 1 ? _quantity-- : null),
                                  child: const Icon(Icons.keyboard_arrow_down, size: 18)
                              ),
                            ],
                          ),
                          const SizedBox(width: 8),
                          const Text('+', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildTextField(hint: 'Amount Due (Optional)', controller: _amountDueOptionalController, prefix: '₹ ')),
                  const SizedBox(width: 8),
                  Switch(
                    value: _isAmountDueEnabled,
                    onChanged: (val) => setState(() => _isAmountDueEnabled = val),
                    activeTrackColor: Colors.orange.withAlpha(120),
                    activeThumbColor: Colors.orange,
                  )
                ],
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
                      _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
                    });
                  }
                },
                icon: const Icon(Icons.calendar_month, size: 18),
                label: const Text('Select Date Manually'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
              ),
              const SizedBox(height: 20),
              _buildSummaryRow('Subtotal:', '₹ ${_subtotal.toStringAsFixed(2)}'),
              _buildSummaryRow('GST (18%):', '₹ ${_gstAmount.toStringAsFixed(2)}'),
              _buildSummaryRow('Total:', '₹ ${_total.toStringAsFixed(2)}', isBold: true),
              _buildSummaryRow('Paid on:', '16 May 2026'),
              _buildSummaryRow('Amount Due:', '₹ ${_total.toStringAsFixed(2)}'),
              const SizedBox(height: 32),
              const Text('BILL TO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 16),
              _buildTextField(hint: 'Legal Business Name (Required)', controller: _billToNameController),
              const SizedBox(height: 12),
              _buildTextField(hint: 'Your GSTIN', controller: _billToGstinController),
              const SizedBox(height: 12),
              _buildTextField(hint: 'Address', controller: _billToAddressController),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _buildTextField(hint: 'City', controller: _billToCityController)),
                  const SizedBox(width: 12),
                  Expanded(child: _buildTextField(hint: 'Postal Code / ZIP Code', controller: _billToZipController)),
                ],
              ),
              const SizedBox(height: 12),
              _buildTextField(hint: 'Email', controller: _billToEmailController),
              const SizedBox(height: 12),
              _buildTextField(hint: 'Website', controller: _billToWebsiteController),
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
        color: const Color(0xFFBDBDBD), // Medium grey background
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF4CAF50), width: 2), // Green border
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70)),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  Widget _buildTextField({required String hint, required TextEditingController controller, String? prefix}) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        prefixText: prefix,
        prefixStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 45,
      child: Row(
        children: [
          Image.network('https://flagcdn.com/w20/in.png', width: 20,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.flag, size: 20)),
          const SizedBox(width: 8),
          const Text('+91', style: TextStyle(fontSize: 14)),
          const VerticalDivider(indent: 10, endIndent: 10, color: Colors.grey),
          Expanded(
            child: TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(fontSize: 14),
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                filled: false,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
              ),
            ),
          ),
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
          Text(label, style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: Colors.black87
          )),
          Text(value, style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: Colors.black87
          )),
        ],
      ),
    );
  }
}
