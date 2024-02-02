import 'package:aasturesources/view/gpa_calculator.dart';
import 'package:aasturesources/view/lecture_note_list.dart';
import 'package:aasturesources/view/module_list_view.dart';
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
      drawer: Drawer(
        backgroundColor: Colors.transparent.withOpacity(0.8),
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/pics/appstore.png',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            ListTile(
              title: const Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('showUpdateView');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'About Me',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('showAboutMeView');
              },
            ),
            const Divider()
          ],
        ),
      ),
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
