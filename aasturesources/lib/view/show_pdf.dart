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
      body: SfPdfViewer.asset(
        'assets/pdfs/Anthropology Module.pdf',
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
      body: SfPdfViewer.asset(
        'assets/pdfs/Communicative English Module.pdf',
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
      body: SfPdfViewer.asset(
        'assets/pdfs/General Pysychology.pdf',
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
      body: SfPdfViewer.asset(
        'assets/pdfs/Geography Module.pdf',
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
      body: SfPdfViewer.asset(
        'assets/pdfs/Logic and Critical Thinking.pdf',
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
      body: SfPdfViewer.asset(
        'assets/pdfs/Maths for Natural Sciecne.pdf',
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
      body: SfPdfViewer.asset(
        'assets/pdfs/Physical Fitness Module.pdf',
        controller: _pdfViewerController,
      ),
    );
  }
}
