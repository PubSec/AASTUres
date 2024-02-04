// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:aasturesources/consts/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icon.dart' as line;
import 'package:open_file/open_file.dart';

class MyModuleListView extends StatefulWidget {
  const MyModuleListView({super.key});

  @override
  State<MyModuleListView> createState() => _MyModuleListViewState();
}

class _MyModuleListViewState extends State<MyModuleListView> {
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
        future: DefaultAssetBundle.of(context).loadString('AssetManifest.json'),
        builder: (context, item) {
          if (item.hasData) {
            Map? jsonMap = json.decode(item.data!);
            List? pdfs = jsonMap?.keys
                .where((element) => element.endsWith(".pdf"))
                .toList();
            // if you only have the same kind of file use
            // List? pdfs = jsonMap?.keys.toList();
            return Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
              ),
              child: ListView.separated(
                itemCount: pdfs!.length,
                itemBuilder: (context, index) {
                  var path = pdfs[index].toString();
                  var title = path.split("/").last.toString();
                  title = title.replaceAll("%20", '');
                  title = title.split(".").first;
                  return ListTile(
                    tileColor: Colors.white,
                    title: Text(title),
                    onTap: () async {
                      await OpenFile.open(path);
                    },
                    onLongPress: () => HapticFeedback.vibrate(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            );
          } else {
            const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return ListView.separated(
            itemBuilder: (context, index) => const ShimmerEffectView(),
            separatorBuilder: (context, index) => const SizedBox(height: 13.0),
            itemCount: 7,
          );
        },
      ),
    );
  }
}
