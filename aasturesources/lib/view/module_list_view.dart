// ignore_for_file: use_build_context_synchronously

// import 'package:aasturesources/consts/permissions_handler.dart';
import 'package:aasturesources/consts/shimmer_effect.dart';
import 'package:aasturesources/view/view_pdf.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;

class MyModuleListView extends StatefulWidget {
  const MyModuleListView({super.key});

  @override
  State<MyModuleListView> createState() => _MyModuleListViewState();
}

class _MyModuleListViewState extends State<MyModuleListView> {
  late Future<ListResult> moduleFiles;

  @override
  void initState() {
    moduleFiles = FirebaseStorage.instance.ref('/modules').listAll();
    // checkPermission();
    super.initState();
  }

  // bool isPermission = false;
  // var checkAllPermissions = CheckPermission();

  // checkPermission() {
  //   bool permission = checkAllPermissions.isStoragePermission();

  //   if (permission) {
  //     setState(() {
  //       isPermission = true;
  //     });
  //   }
  // }

  Future<void> downloadUrlFun({required String nameofModule}) async {
    String downloadUrl = await FirebaseStorage.instance
        .ref('/modules/$nameofModule')
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
        backgroundColor: Colors.transparent,
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
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    visualDensity: VisualDensity.comfortable,
                    tileColor: Colors.white,
                    trailing: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.download)),
                    title: Text(
                      file.name,
                      style: const TextStyle(color: Colors.black),
                    ),
                    onTap: () {
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
            return ListView.separated(
              itemBuilder: ((context, index) => const ShimmerEffectView()),
              separatorBuilder: (context, index) => const SizedBox(
                height: 13,
              ),
              itemCount: 10,
            );
          }
        },
      ),
    );
  }
}
