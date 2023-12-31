import 'package:aasturesources/view/gpa_calculator.dart';
import 'package:aasturesources/view/lecture_note_list.dart';
import 'package:aasturesources/view/module_list_view.dart';
import 'package:aasturesources/view/upload_file.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;
import 'package:firebase_core/firebase_core.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

int currentViewIndex = 0;

final screens = [
  const MyModuleListView(),
  const MyLectureNoteView(),
  const MyGPACalculatorView(),
  const MyUploadFileView(),
];

class _MyHomeViewState extends State<MyHomeView> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentViewIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: const Color.fromARGB(255, 61, 238, 114),
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        height: 58,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        animationDuration: const Duration(seconds: 2),
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            selectedIcon: line.LineIcon.home(),
            label: 'Home',
            tooltip: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.note_outlined,
              color: Colors.white,
            ),
            selectedIcon: line.LineIcon.stickyNote(),
            label: 'Lecture Notes',
            tooltip: 'Lecture Notes',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.calculate_outlined,
              color: Colors.white,
            ),
            selectedIcon: Icon(Icons.calculate),
            label: 'GPA Calculator',
            tooltip: 'GPA Calculator',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.upload,
              color: Colors.white,
            ),
            selectedIcon: line.LineIcon.upload(),
            label: 'Upload',
            tooltip: 'Upload ',
          ),
        ],
        selectedIndex: currentViewIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentViewIndex = index;
          });
        },
      ),
    );
  }
}
