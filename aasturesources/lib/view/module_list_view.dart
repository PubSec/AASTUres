import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyPDFListView extends StatefulWidget {
  const MyPDFListView({super.key});

  @override
  State<MyPDFListView> createState() => _MyPDFListViewState();
}

class _MyPDFListViewState extends State<MyPDFListView> {
  late Future<ListResult> moduleFiles;
  final PdfViewerController _pdfViewerController = PdfViewerController();

  @override
  void initState() {
    moduleFiles = FirebaseStorage.instance.ref('/modules').listAll();
    _pdfViewerController;
    _textEditingController;
    super.initState();
  }

  String? searchText;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const line.LineIcon.accusoft(
          size: 29,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: moduleFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;

            return ListView.builder(
              itemBuilder: (context, index) {
                final file = files[index];
                return ListTile(
                  title: Text(file.name),
                  onTap: () {
                    // showPDF();
                  },
                );
              },
              itemCount: files.length,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred'),
            );
          } else {
            return const Column(
              children: [
                Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white),
                ),
                CircularProgressIndicator()
              ],
            );
          }
        },
      ),
    );
  }
}
