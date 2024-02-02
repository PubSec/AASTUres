// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:aasturesources/consts/shimmer_effect.dart';
import 'package:aasturesources/view/view_pdf.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    super.initState();
  }

  int dropDownValue = 1;
  int? sectionNumber;

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    final selectedFile = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if (selectedFile == null) {
      return false;
    }

    setState(() {
      pickedFile = selectedFile.files.first;
    });
  }

  Future uploadFile({required int section}) async {
    final path = 'lecture_notes/Section: $section, ${pickedFile!.name}';
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
              height: 40,
            );
          }
        }),
      );

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
// loaded file appear using this line to 112
                return Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                );
              },
              itemCount: files.length,
            );
// if an error occurs this is thrown
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error occured'),
            );
// this will appear until the data is loaded
          } else {
            return ListView.separated(
              itemBuilder: (context, index) => const ShimmerEffectView(),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 13.0),
              itemCount: 10,
            );
          }
        },
      ),
      floatingActionButton: ElevatedButton(
        onLongPress: () {
          HapticFeedback.vibrate();
        },
        onPressed: () {
          showModalBottomSheet(
            barrierColor: Colors.black,
            useSafeArea: true,
            showDragHandle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Colors.transparent.withOpacity(0.8),
            context: context,
            builder: (builder) {
              return SizedBox(
                child: Column(
                  children: [
                    // onpressed select file.
                    ListTile(
                      tileColor: Colors.white,
                      leading: const line.LineIcon.bookOpen(),
                      onTap: () {
                        selectFile();
                      },
                      title: const Text(
                        'Select File',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    ListTile(
                      tileColor: Colors.white,
                      leading: const line.LineIcon.upload(),
                      onTap: () {
                        if (sectionNumber == null || sectionNumber == '') {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Please enter a section number.',
                              ),
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
                          uploadFile(section: sectionNumber!);
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Uploading')));
                        }
                      },
                      title: const Text(
                        'Upload File',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DropdownMenu(
                      textStyle: const TextStyle(color: Colors.white),
                      width: 350,
                      helperText: 'Section Number',
                      onSelected: (selectedSectionNumber) {
                        setState(() {
                          sectionNumber = selectedSectionNumber;
                        });
                      },
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 1, label: '1'),
                        DropdownMenuEntry(value: 2, label: '2'),
                        DropdownMenuEntry(value: 3, label: '3'),
                        DropdownMenuEntry(value: 4, label: '4'),
                        DropdownMenuEntry(value: 5, label: '5'),
                        DropdownMenuEntry(value: 6, label: '6'),
                        DropdownMenuEntry(value: 7, label: '7'),
                        DropdownMenuEntry(value: 8, label: '8'),
                        DropdownMenuEntry(value: 9, label: '9'),
                        DropdownMenuEntry(value: 10, label: '10'),
                        DropdownMenuEntry(value: 11, label: '11'),
                        DropdownMenuEntry(value: 12, label: '12'),
                        DropdownMenuEntry(value: 13, label: '13'),
                        DropdownMenuEntry(value: 14, label: '14'),
                        DropdownMenuEntry(value: 15, label: '15'),
                        DropdownMenuEntry(value: 16, label: '16'),
                        DropdownMenuEntry(value: 17, label: '17'),
                        DropdownMenuEntry(value: 18, label: '18'),
                        DropdownMenuEntry(value: 19, label: '19'),
                        DropdownMenuEntry(value: 20, label: '20'),
                        DropdownMenuEntry(value: 21, label: '21'),
                        DropdownMenuEntry(value: 22, label: '22'),
                        DropdownMenuEntry(value: 23, label: '23'),
                        DropdownMenuEntry(value: 24, label: '24'),
                        DropdownMenuEntry(value: 25, label: '25'),
                        DropdownMenuEntry(value: 26, label: '26'),
                        DropdownMenuEntry(value: 27, label: '27'),
                        DropdownMenuEntry(value: 28, label: '28'),
                        DropdownMenuEntry(value: 29, label: '29'),
                        DropdownMenuEntry(value: 30, label: '30'),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add_chart_sharp),
      ),
    );
  }
}
