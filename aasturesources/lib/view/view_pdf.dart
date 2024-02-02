import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:line_icons/line_icon.dart' as line;

class MyPDFView extends StatefulWidget {
  final String pdfUrl;
  final String pdfTitle;
  const MyPDFView({super.key, required this.pdfUrl, required this.pdfTitle});

  @override
  State<MyPDFView> createState() => _MyPDFViewState();
}

class _MyPDFViewState extends State<MyPDFView> {
  String searchText = '';
  final TextEditingController _textEditingController = TextEditingController();
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _textEditingController;
    _pdfViewerController;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController;
    _pdfViewerController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pdfTitle,
          style: const TextStyle(fontSize: 15),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _pdfViewerController.previousPage();
            },
            icon: const line.LineIcon.backward(
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              _pdfViewerController.nextPage();
            },
            icon: const line.LineIcon.forward(
              color: Colors.black,
            ),
          ),
          AnimSearchBar(
            width: 210,
            textController: _textEditingController,
            onSuffixTap: () {
              _textEditingController.clear();
            },
            onSubmitted: (String searchText) {
              _pdfViewerController.searchText(_textEditingController.text);
            },
          )
        ],
      ),
      body: SfPdfViewer.network(
        widget.pdfUrl,
        controller: _pdfViewerController,
        canShowScrollHead: false,
        onDocumentLoadFailed: (details) {
          const Text('Failed to load file.');
        },
      ),
    );
  }
}
