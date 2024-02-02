import 'package:aasturesources/consts/firebase_api.dart';
import 'package:aasturesources/view/about_me.dart';
import 'package:aasturesources/view/home_view.dart';
import 'package:aasturesources/view/update_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fresh Resources',
      theme: ThemeData(
        primaryColor: Colors.white,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MyHomeView(),
      routes: {
        'showUpdateView': (context) => const MyUpdateListView(),
        'showAboutMeView': (context) => const MyAboutMeView()
      },
    );
  }
}
