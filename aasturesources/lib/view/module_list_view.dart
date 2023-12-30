import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class MyModuleListView extends StatefulWidget {
  const MyModuleListView({super.key});

  @override
  State<MyModuleListView> createState() => _MyModuleListViewState();
}

class _MyModuleListViewState extends State<MyModuleListView> {
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
                    SfPdfViewer.network(
                      '${file.getDownloadURL()}',
                      controller: _pdfViewerController,
                    );
                  },
                );
              },
              itemCount: files.length,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'An error occurred',
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Loading...',
                    style: TextStyle(color: Colors.white),
                  ),
                  CircularProgressIndicator()
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
