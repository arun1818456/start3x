import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../../exports.dart';

class InvoiceGeneratorController extends GetxController {

  bool addTermsEnabled = false;
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

  //for Contract
  final TextEditingController services = TextEditingController();
  final TextEditingController termsServices = TextEditingController();

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
    String f(String? text) => (text == null || text.trim().isEmpty) ? '---' : text;

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
                        pw.Text('Invoice No: ${f( invoiceNoController.text)}'),
                        pw.Text('Date: ${f( dateController.text)}'),
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
                        pw.Text(f(companyNameController.text)),
                        pw.Text(f(phoneController.text)),
                        pw.Text('GSTIN: ${f(gstinController.text)}'),
                        pw.Text(f(addressController.text)),
                        pw.Text('${f(cityController.text)}, ${f(zipController.text)}'),
                        pw.Text(f(emailController.text)),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 50),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('BILL TO:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text(f(billToNameController.text)),
                        pw.Text('GSTIN: ${f(billToGstinController.text)}'),
                        pw.Text(f(billToAddressController.text)),
                        pw.Text('${f(billToCityController.text)}, ${f(billToZipController.text)}'),
                        pw.Text(f(billToEmailController.text)),
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
                    f( itemNameController.text),
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
              pw.Text('Bank: ${f(bankNameController.text)}'),
              pw.Text('A/C No: ${f(accountNoController.text)}'),
              pw.Text('Name: ${f(holderNameController.text)}'),
              pw.Text('IFSC: ${f(ifscController.text)}'),
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

  Future<void> exportAgreement() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(35),
        build: (context) {
          return [
            pw.Center(
              child: pw.Column(
                children: [

                  // pw.Container(
                  //   width: 70,
                  //   height: 70,
                  //   decoration: const pw.BoxDecoration(
                  //     color: PdfColors.teal,
                  //     shape: pw.BoxShape.circle,
                  //   ),
                  //   child: pw.Center(
                  //     child: pw.Text(
                  //       "id",
                  //       style: pw.TextStyle(
                  //         color: PdfColors.white,
                  //         fontWeight: pw.FontWeight.bold,
                  //         fontSize: 34,
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  pw.SizedBox(height: 20),

                  pw.Text(
                    "Confirmed & Verified Agreement",
                    style: pw.TextStyle(
                      color: PdfColors.blue,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),

                  pw.SizedBox(height: 10),

                  pw.Text("Prepared by"),

                  pw.SizedBox(height: 10),

                  pw.Text(
                    companyNameController.text.trim(),
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  pw.Text("GSTIN : ${gstinController.text.trim()}"),

                  pw.SizedBox(height: 15),

                  pw.Text("For"),

                  pw.SizedBox(height: 10),

                  pw.Text(
                    billToNameController.text.trim(),
                    style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  pw.Text("GSTIN : ${billToGstinController.text.trim()}"),

                  pw.SizedBox(height: 10),

                  pw.Text(dateController.text.trim()),
                ],
              ),
            ),
            pw.SizedBox(height: 40),
            pw.Text(
              "SUMMARY",
              style: pw.TextStyle(
                color: PdfColors.blue,
                fontSize: 28,
                fontWeight: pw.FontWeight.bold,
              ),
            ),

            pw.SizedBox(height: 10),

            pw.RichText(
             text: pw.TextSpan(
               text: "The following contract has been prepared ",
               children: [
                 pw.TextSpan(
                   text: companyNameController.text.trim(),
                   style: pw.TextStyle(
                     fontWeight: pw.FontWeight.bold,
                   ),
                 ),
                 pw.TextSpan(
                   text: " for \n",
                 ),
                 pw.TextSpan(
                   text: billToNameController.text.trim(),
                   style: pw.TextStyle(
                     fontWeight: pw.FontWeight.bold,
                   ),
                 ),
                 pw.TextSpan(
                   text: ". This contract outlines the services provided by ",
                 ),
                 pw.TextSpan(
                   text: companyNameController.text.trim(),
                   style: pw.TextStyle(
                     fontWeight: pw.FontWeight.bold,
                   ),
                 ),
                 ]
             )
            ),

            pw.SizedBox(height: 30),

            //==========================
            // SERVICES
            //==========================

            pw.Text(
              "Services",
              style: pw.TextStyle(
                color: PdfColors.orange,
                fontWeight: pw.FontWeight.bold,
                fontSize: 22,
              ),
            ),

            pw.SizedBox(height: 10),

            pw.Text(
              services.text,
              textAlign: pw.TextAlign.justify,
            ),

            pw.SizedBox(height: 30),

            //==========================
            // Fee Schedule
            //==========================

            pw.Text(
              "FEE SCHEDULE",
              style: pw.TextStyle(
                color: PdfColors.blue,
                fontWeight: pw.FontWeight.bold,
                fontSize: 28,
              ),
            ),

            pw.SizedBox(height: 15),

            pw.Table(
              border: pw.TableBorder.all(),
              columnWidths: {
                0: const pw.FlexColumnWidth(5),
                1: const pw.FlexColumnWidth(2),
              },
              children: [

                pw.TableRow(
                  children: [

                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Text(
                        "SERVICE DESCRIPTION COST",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),

                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Text(
                        "TOTAL",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),

                  ],
                ),

                pw.TableRow(
                  children: [

                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Text(
                        itemNameController.text,
                      ),
                    ),

                    pw.Padding(
                      padding: const pw.EdgeInsets.all(10),
                      child: pw.Text(
                        priceController.text,
                      ),
                    ),

                  ],
                ),
              ],
            ),

            pw.SizedBox(height: 35),

            //==========================
            // TERMS
            //==========================

            pw.Text(
              "TERMS OF SERVICE",
              style: pw.TextStyle(
                color: PdfColors.blue,
                fontWeight: pw.FontWeight.bold,
                fontSize: 28,
              ),
            ),

            pw.SizedBox(height: 20),
            pw.Text(
              termsServices.text,
              textAlign: pw.TextAlign.justify,
            ),

            pw.SizedBox(height: 40),

            //==========================
            // SIGNATURE
            //==========================

            pw.Text(
              "By signing below both parties agree to the terms and conditions mentioned above.",
              textAlign: pw.TextAlign.justify,
            ),

            pw.SizedBox(height: 30),

            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [

                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [

                    pw.Text(
                      "Insights Door",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),

                    pw.SizedBox(height: 60),

                    pw.Container(
                      width: 180,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          bottom: pw.BorderSide(),
                        ),
                      ),
                    ),

                    pw.Text("Signature"),
                  ],
                ),

                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [

                    pw.Text(
                      "GAB SOLARTECH PRIVATE LIMITED",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),

                    pw.SizedBox(height: 60),

                    pw.Container(
                      width: 180,
                      decoration: const pw.BoxDecoration(
                        border: pw.Border(
                          bottom: pw.BorderSide(),
                        ),
                      ),
                    ),

                    pw.Text("Signature"),
                  ],
                ),
              ],
            ),
          ];
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (format) async => pdf.save(),
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
