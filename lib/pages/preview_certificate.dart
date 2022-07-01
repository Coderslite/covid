// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// class PreviewCertificate extends StatefulWidget {
//   const PreviewCertificate({ Key? key }) : super(key: key);

//   @override
//   State<PreviewCertificate> createState() => _PreviewCertificateState();
// }

// class _PreviewCertificateState extends State<PreviewCertificate> {
//    final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

//   void _printScreen() {
//     Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
//       final doc = pw.Document();

//       final image = await WidgetWraper.fromKey(
//         key: _printKey,
//         pixelRatio: 2.0,
//       );

//       doc.addPage(pw.Page(
//           pageFormat: format,
//           build: (pw.Context context) {
//             return pw.Center(
//               child: pw.Expanded(
//                 child: pw.Image(image),
//               ),
//             );
//           }));

//       return doc.save();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: AppBar(title: Text("Preview")),
//         body: Column()
//     );
//   }
// }