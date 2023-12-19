import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;

class MyLectureNoteView extends StatelessWidget {
  const MyLectureNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Lecture Notes',
          style: TextStyle(color: Colors.white),
        ),
        leading: const line.LineIcon.accusoft(
          color: Colors.white,
          size: 29,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: ListTile(
          tileColor: Colors.white,
          leading: const line.LineIcon.chalkboardTeacher(),
          title: const Text('Logic Lecture Note Chapter 1 '),
          onTap: () {
            Navigator.of(context).pushNamed('showLogicChapter1Note');
          },
        ),
      ),
    );
  }
}
