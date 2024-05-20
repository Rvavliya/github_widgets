import 'package:flutter/material.dart';
// import 'package:pdfx/pdfx.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class PdfViewerExample extends StatefulWidget {
  const PdfViewerExample({super.key});

  @override
  State<PdfViewerExample> createState() => _PdfViewerExampleState();
}

class _PdfViewerExampleState extends State<PdfViewerExample> {
  // final pdfPinchController = PdfController(
  //   document: PdfDocument.openAsset('assets/dummy.pdf'),
  // );
  @override
  void initState() {
    super.initState();
  }

  bool isReady = false;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(
        title: Text("PdfViewer"),
      ),
      // body: PdfView(
      //   controller: pdfPinchController,
      //   onDocumentLoaded: (document) {},
      //   onPageChanged: (page) {},
      // ),
    );
  }
}
