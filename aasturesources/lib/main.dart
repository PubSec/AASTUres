import 'package:aasturesources/view/home_view.dart';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(
      connectionNotificationOptions: const ConnectionNotificationOptions(
        disconnectedBackgroundColor: Colors.black,
        disconnectedDuration: Duration(seconds: 10),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fresh Resources',
        theme: ThemeData(
          primaryColor: Colors.white,
          useMaterial3: true,
          fontFamily: 'LemonMilk',
        ),
        home: const MyHomeView(),
      ),
    );
  }
}
