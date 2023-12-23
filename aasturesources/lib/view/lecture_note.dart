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
      body: Column(
        children: [
          const Row(),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ListTile(
              tileColor: Colors.white,
              leading: const line.LineIcon.chalkboardTeacher(),
              title: const Text('Logic Lecture Note Chapter 1 '),
              onTap: () {
                Navigator.of(context).pushNamed('showLogicChapter1Note');
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: ListTile(
              tileColor: Colors.white,
              leading: const line.LineIcon.chalkboardTeacher(),
              title: const Text('Logic Lecture Note Chapter 2'),
              onTap: () {
                Navigator.of(context).pushNamed('showLogicChapter2Note');
              },
            ),
          ),
        ],
      ),
    );
  }
}
