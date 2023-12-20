import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;

class MyUploadFileView extends StatefulWidget {
  const MyUploadFileView({super.key});

  @override
  State<MyUploadFileView> createState() => _MyUploadFileViewState();
}

class _MyUploadFileViewState extends State<MyUploadFileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Upload Resources',
          style: TextStyle(color: Colors.white),
        ),
        leading: const line.LineIcon.accusoft(
          size: 29,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 140),
        child: Column(
          children: [
            ButtonBar(
              buttonHeight: 100,
              children: [
                Center(
                  child: Container(
                    color: Colors.white,
                    margin: const EdgeInsets.only(right: 130),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Select File',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Center(
              child: Image.asset(
                'assets/illustrations/bendy-young-man-studying-something-and-watching-a-video.gif',
                scale: 2.9,
              ),
            )
          ],
        ),
      ),
    );
  }
}
