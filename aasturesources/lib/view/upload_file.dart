// ignore_for_file: unused_local_variable

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
  final TextEditingController _controller = TextEditingController();
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  @override
  void initState() {
    super.initState();
    _controller;
  }

  Future selectFile() async {
    final selectedFile = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if (selectedFile == null) {
      return;
    }

    setState(() {
      pickedFile = selectedFile.files.first;
    });
  }

  Future uploadFile({required String section}) async {
    final path = 'lecture_notes/${pickedFile!.name}   Section: $section';
    final file = File(pickedFile!.path!);
    try {
      final ref = FirebaseStorage.instance.ref().child(path);
      ref.putFile(file);

      setState(() {
        uploadTask = ref.putFile(file);
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

    final snapshot = await uploadTask!.whenComplete(() {
      setState(() {
        uploadTask = null;
      });
    });

    final urlDownload = await snapshot.ref.getDownloadURL();
    // ignore: avoid_print
    print('Download Link: $urlDownload');
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Upload Successful'),
      ),
    );
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
              height: 50,
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
                      '${(100 * progress).floorToDouble()}%',
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
              height: 80,
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
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 45),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 50.0, right: 30),
                child: Text(
                  'Class Represetatives can upload files to be view in Lecture Notes tab. Please change the file name to something appropriate. ',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              if (pickedFile != null)
                SingleChildScrollView(
                  child: Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 120,
                          color: Colors.black45,
                          child: Image.file(
                            File(pickedFile!.path!),
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/pics/image.png');
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text('${pickedFile!.bytes}'),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 20),
                          child: Text(
                            '$pickedFileName',
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Row(
                children: [
                  ButtonBar(
                    buttonHeight: 100,
                    children: [
                      Center(
                        child: Container(
                          color: Colors.white,
                          width: 150,
                          margin: const EdgeInsets.only(
                            left: 20,
                            top: 50,
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
                    buttonHeight: 50,
                    children: [
                      Center(
                        child: Container(
                          width: 150,
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 50),
                          child: TextButton(
                            onPressed: () {
                              if (_controller.text.isEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text(
                                        'Please enter section number'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Ok'),
                                      )
                                    ],
                                  ),
                                );
                              } else {
                                uploadFile(section: _controller.text);
                              }
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
                ],
              ),
              SizedBox(
                height: 100,
                width: 150,
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    errorStyle: TextStyle(color: Colors.red),
                    hintText: 'Section Number',
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 12,
                      height: 5,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              buildProgress(),
            ],
          ),
        ),
      ),
    );
  }
}
