import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../exports.dart';

class InvoiceGeneratorController extends GetxController {
  // Company Details
  final TextEditingController invoiceNoController = TextEditingController(text: 'SME001');
  final TextEditingController dateController = TextEditingController(text: '0/0/0');
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController gstinController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();

  // Payment Instruction
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNoController = TextEditingController();
  final TextEditingController holderNameController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();

  // Create Bill
  final TextEditingController priceController = TextEditingController();
  final TextEditingController itemNameController = TextEditingController();
  int quantity = 1;
  final TextEditingController amountDueOptionalController = TextEditingController();
  bool isAmountDueEnabled = false;

  // Bill To
  final TextEditingController billToNameController = TextEditingController();
  final TextEditingController billToGstinController = TextEditingController();
  final TextEditingController billToAddressController = TextEditingController();
  final TextEditingController billToCityController = TextEditingController();
  final TextEditingController billToZipController = TextEditingController();
  final TextEditingController billToEmailController = TextEditingController();
  final TextEditingController billToWebsiteController = TextEditingController();

  // Calculations
  double get subtotal {
    double price = double.tryParse( priceController.text) ?? 0.0;
    return price * quantity;
  }
  double get gstAmount => subtotal * 0.18;
  double get total => subtotal + gstAmount;

  Future<void> exportToPdf() async {
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
                        pw.Text('Invoice No: ${_f( invoiceNoController.text)}'),
                        pw.Text('Date: ${_f( dateController.text)}'),
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
                        pw.Text(_f(companyNameController.text)),
                        pw.Text(_f(phoneController.text)),
                        pw.Text('GSTIN: ${_f(gstinController.text)}'),
                        pw.Text(_f(addressController.text)),
                        pw.Text('${_f(cityController.text)}, ${_f(zipController.text)}'),
                        pw.Text(_f(emailController.text)),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 50),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('BILL TO:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text(_f(billToNameController.text)),
                        pw.Text('GSTIN: ${_f(billToGstinController.text)}'),
                        pw.Text(_f(billToAddressController.text)),
                        pw.Text('${_f(billToCityController.text)}, ${_f(billToZipController.text)}'),
                        pw.Text(_f(billToEmailController.text)),
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
                    _f( itemNameController.text),
                    quantity.toString(),
                    'Rs. ${ priceController.text.isEmpty ? '0' :  priceController.text}',
                    'Rs. $subtotal.toStringAsFixed(2)}'
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
                      pw.Text('Subtotal: Rs. ${subtotal.toStringAsFixed(2)}'),
                      pw.Text('GST (18%): Rs. ${gstAmount.toStringAsFixed(2)}'),
                      pw.Divider(color: PdfColors.grey),
                      pw.Text('Total: Rs. ${total.toStringAsFixed(2)}',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                      pw.SizedBox(height: 5),
                      pw.Text('Amount Due: Rs. ${total.toStringAsFixed(2)}',
                          style: pw.TextStyle(color: PdfColors.red)),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 40),
              pw.Divider(color: PdfColors.grey300),
              pw.Text('Payment Instructions:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('Bank: ${_f(bankNameController.text)}'),
              pw.Text('A/C No: ${_f(accountNoController.text)}'),
              pw.Text('Name: ${_f(holderNameController.text)}'),
              pw.Text('IFSC: ${_f(ifscController.text)}'),
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
        name: 'Invoice_${invoiceNoController.text.isEmpty ? "New" : invoiceNoController.text}.pdf'
    );
  }

  @override
  void onInit() {
    priceController.addListener(() => update());
    super.onInit();
  }

  @override
  void dispose() {
     priceController.dispose();
    super.dispose();
  }
}
