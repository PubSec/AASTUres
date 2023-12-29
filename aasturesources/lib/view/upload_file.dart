import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;
import 'package:file_picker/file_picker.dart';

class MyUploadFileView extends StatefulWidget {
  const MyUploadFileView({super.key});

  @override
  State<MyUploadFileView> createState() => _MyUploadFileViewState();
}

class _MyUploadFileViewState extends State<MyUploadFileView> {
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    final selectedFile = await FilePicker.platform.pickFiles();

    if (selectedFile == null) {
      return;
    }

    setState(() {
      pickedFile = selectedFile.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'upload_from_app/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    try {
      final ref = FirebaseStorage.instance.ref().child(path);
      setState(() {
        final uploadTask = ref.putFile(file);
      });
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
    final snapshot = uploadTask!.whenComplete(() {});
    // final urlDownload = await snapshot.ref.getProperty;

    setState(() {
      uploadTask = null;
    });
  }

  buildProgress() => StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;
            return SizedBox(
              height: 60,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}%',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox(
              height: 60,
            );
          }
        }),
      );

  @override
  Widget build(BuildContext context) {
    final pickedFileName = pickedFile != null
        ? pickedFile!.name
        : const Text(
            'No files picked',
            style: TextStyle(
              color: Colors.white,
            ),
          );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Upload Resources',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: const line.LineIcon.accusoft(
          size: 29,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 0),
        child: Column(
          children: [
            if (pickedFile != null)
              SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 150,
                        color: Colors.black45,
                        child: Image.file(File(pickedFile!.path!)),
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        '$pickedFileName',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ButtonBar(
              buttonHeight: 100,
              children: [
                Center(
                  child: Container(
                    color: Colors.white,
                    width: 150,
                    margin: const EdgeInsets.only(
                      top: 50,
                      right: 100,
                    ),
                    child: TextButton(
                      onPressed: () {
                        selectFile();
                      },
                      child: const Text(
                        'Select File',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
            ButtonBar(
              buttonHeight: 100,
              children: [
                Center(
                  child: Container(
                    width: 150,
                    color: Colors.white,
                    margin: const EdgeInsets.only(right: 100),
                    child: TextButton(
                      onPressed: () {
                        uploadFile();
                      },
                      child: const Text(
                        'Upload File',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            buildProgress(),
          ],
        ),
      ),
    );
  }
}
