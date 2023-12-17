import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyAnthroPDFView extends StatefulWidget {
  const MyAnthroPDFView({super.key});

  @override
  State<MyAnthroPDFView> createState() => _MyAnthroPDFViewState();
}

class _MyAnthroPDFViewState extends State<MyAnthroPDFView> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _pdfViewerController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/modules%2FAnthropology%20Module%20(1).pdf?alt=media&token=1d467ba9-03e9-4baf-9c3f-bd8832abb250',
        controller: _pdfViewerController,
      ),
    );
  }
}

class MyEnglishPDFView extends StatefulWidget {
  const MyEnglishPDFView({super.key});

  @override
  State<MyEnglishPDFView> createState() => _MyEnglishPDFViewState();
}

class _MyEnglishPDFViewState extends State<MyEnglishPDFView> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _pdfViewerController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/modules%2FCommunicative%20English%20Module%20(1).pdf?alt=media&token=bb117ff3-c28b-49f0-9947-44d74c889385',
        controller: _pdfViewerController,
      ),
    );
  }
}

class MyGeneralPyshoPDFView extends StatefulWidget {
  const MyGeneralPyshoPDFView({super.key});

  @override
  State<MyGeneralPyshoPDFView> createState() => _MyGeneralPyshoPDFViewState();
}

class _MyGeneralPyshoPDFViewState extends State<MyGeneralPyshoPDFView> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _pdfViewerController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/modules%2FGeneral%20Pysychology.pdf?alt=media&token=ae2d39e5-a1e2-47cf-af4d-1f7c0504dcc7',
        controller: _pdfViewerController,
      ),
    );
  }
}

class MyGeoPDFView extends StatefulWidget {
  const MyGeoPDFView({super.key});

  @override
  State<MyGeoPDFView> createState() => _MyGeoPDFViewState();
}

class _MyGeoPDFViewState extends State<MyGeoPDFView> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _pdfViewerController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/modules%2FGeography%20Module.pdf?alt=media&token=a7c48e85-bc9a-4486-8f52-56aca05700de',
        controller: _pdfViewerController,
      ),
    );
  }
}

class MyLogicPDFView extends StatefulWidget {
  const MyLogicPDFView({super.key});

  @override
  State<MyLogicPDFView> createState() => _MyLogicPDFViewState();
}

class _MyLogicPDFViewState extends State<MyLogicPDFView> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _pdfViewerController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/modules%2FLogic%20and%20Critical%20Thinking%20%2528Final%2529%20%25281%2529%20%20FINAL-1-1-1.pdf?alt=media&token=91e9b779-2c32-44eb-b04e-10b8462952e1',
        controller: _pdfViewerController,
      ),
    );
  }
}

class MyMathPDFView extends StatefulWidget {
  const MyMathPDFView({super.key});

  @override
  State<MyMathPDFView> createState() => _MyMathPDFViewState();
}

class _MyMathPDFViewState extends State<MyMathPDFView> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _pdfViewerController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/modules%2FMaths%20for%20Natural%20Sciecne.pdf?alt=media&token=347f1f03-1dee-407f-b790-a07a5ebd6cc7',
        controller: _pdfViewerController,
      ),
    );
  }
}

class MyLogicPatickPDFView extends StatefulWidget {
  const MyLogicPatickPDFView({super.key});

  @override
  State<MyLogicPatickPDFView> createState() => _MyLogicPatickPDFViewState();
}

class _MyLogicPatickPDFViewState extends State<MyLogicPatickPDFView> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _pdfViewerController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.asset(
        'assets/pdfs/Patrick2012.pdf',
        controller: _pdfViewerController,
      ),
    );
  }
}

class MyPhysicalFitPDFView extends StatefulWidget {
  const MyPhysicalFitPDFView({super.key});

  @override
  State<MyPhysicalFitPDFView> createState() => _MyPhysicalFitPDFViewState();
}

class _MyPhysicalFitPDFViewState extends State<MyPhysicalFitPDFView> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _pdfViewerController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/modules%2FPhysical%20Fitness%20Module.pdf?alt=media&token=efa93d14-5946-4c35-97d5-cd50739c24a0',
        controller: _pdfViewerController,
      ),
    );
  }
}
