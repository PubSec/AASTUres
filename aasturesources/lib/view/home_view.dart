import 'package:aasturesources/view/pdf_list_view.dart';
import 'package:aasturesources/view/upload_file.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

int currentViewIndex = 0;

final screens = [
  const MyPDFListView(),
  const MyUploadFileView(),
];

class _MyHomeViewState extends State<MyHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentViewIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.white,
        backgroundColor: Colors.grey.shade900,
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
