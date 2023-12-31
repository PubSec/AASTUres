// ignore_for_file: use_build_context_synchronously

import 'package:aasturesources/view/view_pdf.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;

class MyLectureNoteView extends StatefulWidget {
  const MyLectureNoteView({super.key});

  @override
  State<MyLectureNoteView> createState() => _MyLectureNoteViewState();
}

class _MyLectureNoteViewState extends State<MyLectureNoteView> {
  late Future<ListResult> moduleFiles;

  @override
  void initState() {
    moduleFiles = FirebaseStorage.instance.ref('/lecture_notes').listAll();
    _textEditingController;
    super.initState();
  }

  Future<void> downloadUrlFun({required String nameofModule}) async {
    String downloadUrl = await FirebaseStorage.instance
        .ref('/lecture_notes/$nameofModule')
        .getDownloadURL();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return MyPDFView(
            pdfUrl: downloadUrl,
            pdfTitle: nameofModule,
          );
        },
      ),
    );
  }

  String? searchText;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Lecture Notes',
          style: TextStyle(fontSize: 23),
        ),
        backgroundColor: Colors.black,
        leading: const line.LineIcon.accusoft(
          size: 29,
          color: Colors.white,
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 29,
        ),
      ),
      body: FutureBuilder(
        future: moduleFiles,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final files = snapshot.data!.items;
            return ListView.builder(
              itemBuilder: (context, index) {
                final file = files[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 10,
                    top: 10,
                  ),
                  child: ListTile(
                    tileColor: Colors.white,
                    leading: const line.LineIcon.chalkboardTeacher(
                      color: Colors.black,
                    ),
                    title: Text(
                      file.name,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onTap: () async {
                      downloadUrlFun(nameofModule: file.name);
                    },
                  ),
                );
              },
              itemCount: files.length,
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'An error occurred',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Loading...',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(child: CircularProgressIndicator())
              ],
            );
          }
        },
      ),
    );
  }
}
