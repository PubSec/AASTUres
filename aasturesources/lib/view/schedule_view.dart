import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:line_icons/line_icon.dart' as line;

class MyScheduleView extends StatefulWidget {
  const MyScheduleView({super.key});

  @override
  State<MyScheduleView> createState() => _MyScheduleViewState();
}

class _MyScheduleViewState extends State<MyScheduleView> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _pdfViewerController;
    _textEditingController;
    super.initState();
  }

  String? searchText;

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SfPdfViewer.asset(
        'assets/schedule.pdf',
        controller: _pdfViewerController,
      ),
    );
  }
}
