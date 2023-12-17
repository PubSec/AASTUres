import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;

class MyPDFListView extends StatefulWidget {
  const MyPDFListView({super.key});

  @override
  State<MyPDFListView> createState() => _MyPDFListViewState();
}

class _MyPDFListViewState extends State<MyPDFListView> {
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
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              tileColor: Colors.white,
              leading: const line.LineIcon.peopleCarry(),
              title: const Text('Anthropology Module'),
              onTap: () {
                Navigator.of(context).pushNamed("showAnthroPDF");
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Communicative English Module'),
              leading: const Icon(Icons.chat),
              onTap: () {
                Navigator.of(context).pushNamed("showEnglishPDF");
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('General Pysychology'),
              leading: const line.LineIcon.identificationBadge(),
              onTap: () {
                Navigator.of(context).pushNamed("showPysPDF");
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Geography'),
              leading: const Icon(Icons.circle_outlined),
              onTap: () {
                Navigator.of(context).pushNamed("showGeoPDF");
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Logic and Critical Thinking'),
              leading: const Icon(Icons.earbuds),
              onTap: () {
                Navigator.of(context).pushNamed("showLogicPDF");
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Patrick 2012'),
              leading: const line.LineIcon.book(),
              onTap: () {
                Navigator.of(context).pushNamed("showPatPDF");
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Maths for Natural Science'),
              leading: const line.LineIcon.calculator(),
              onTap: () {
                Navigator.of(context).pushNamed("showMathPDF");
              },
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Text('Physical Fitness'),
              leading: const line.LineIcon.running(),
              onTap: () {
                Navigator.of(context).pushNamed("showFitPDF");
              },
            ),
          ],
        ),
      ),
    );
  }
}
