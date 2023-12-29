import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:line_icons/line_icon.dart' as line;

// showPDF({required Path filePath, }) {
//   return Scaffold(
//     appBar: AppBar(
//       actions: [
//         IconButton(
//           onPressed: () {
//             _pdfViewerController.previousPage();
//           },
//           icon: const line.LineIcon.backward(
//             color: Colors.black,
//           ),
//         ),
//         IconButton(
//           onPressed: () {
//             _pdfViewerController.nextPage();
//           },
//           icon: const line.LineIcon.forward(
//             color: Colors.black,
//           ),
//         ),
//         AnimSearchBar(
//           width: 210,
//           textController: _textEditingController,
//           onSuffixTap: () {},
//           onSubmitted: (String searchText) {
//             _pdfViewerController.searchText(_textEditingController.text);
//           },
//         )
//       ],
//     ),
//     body: SfPdfViewer.file(
//       File(filePath),
//       controller: _pdfViewerController,
//     ),
//   );
// }

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
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/modules%2FCommunicative%20English%20Language%20Skills%20I%20(FLEn%201011)(1).pdf?alt=media&token=1ab7659a-1eee-4c92-bb7f-e90aab134ecd',
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
    _textEditingController;
    _pdfViewerController;
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
    _textEditingController;
    _pdfViewerController;
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
    _textEditingController;
    _pdfViewerController;
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
    _textEditingController;
    _pdfViewerController;
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
    _textEditingController;
    _pdfViewerController;
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
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/resources%2FPatrick2012.pdf?alt=media&token=f9d61805-e80e-442c-ad7d-197f57d897ba',
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
    _textEditingController;
    _pdfViewerController;
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
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/modules%2FPhysical%20Fitness%20Module.pdf?alt=media&token=efa93d14-5946-4c35-97d5-cd50739c24a0',
        controller: _pdfViewerController,
      ),
    );
  }
}

class MyLogicLectureChapter1View extends StatefulWidget {
  const MyLogicLectureChapter1View({super.key});

  @override
  State<MyLogicLectureChapter1View> createState() =>
      _MyLogicLectureChapter1ViewState();
}

class _MyLogicLectureChapter1ViewState
    extends State<MyLogicLectureChapter1View> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _textEditingController;
    _pdfViewerController;
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
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/lecture_notes%2Flogic_lecture_note_1.pdf?alt=media&token=e8eaed33-e134-4d02-bd37-451ec90bae8f',
        controller: _pdfViewerController,
      ),
    );
  }
}

class MyLogicLectureChapter2View extends StatefulWidget {
  const MyLogicLectureChapter2View({super.key});

  @override
  State<MyLogicLectureChapter2View> createState() =>
      _MyLogicLectureChapter2ViewState();
}

class _MyLogicLectureChapter2ViewState
    extends State<MyLogicLectureChapter2View> {
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    _textEditingController;
    _pdfViewerController;
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
      body: SfPdfViewer.network(
        'https://firebasestorage.googleapis.com/v0/b/aastumodulecloud.appspot.com/o/lecture_notes%2Flogic_lecture_note_2.pdf?alt=media&token=f2562446-585d-43b6-9aee-d7caa9d8ae3b',
        controller: _pdfViewerController,
      ),
    );
  }
}
