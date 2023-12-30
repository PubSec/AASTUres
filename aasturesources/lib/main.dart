import 'package:aasturesources/view/home_view.dart';
import 'package:aasturesources/view/show_pdf.dart';
import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
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
        ),
        home: const MyHomeView(),
        routes: {
          "/": (context) => const MyHomeView(),
          // "showAnthroPDF": (context) => const MyAnthroPDFView(),
          "showEnglishPDF": (context) => const MyEnglishPDFView(),
          "showPysPDF": (context) => const MyGeneralPyshoPDFView(),
          "showGeoPDF": (context) => const MyGeoPDFView(),
          "showLogicPDF": (context) => const MyLogicPDFView(),
          "showMathPDF": (context) => const MyMathPDFView(),
          "showPatPDF": (context) => const MyLogicPatickPDFView(),
          "showFitPDF": (context) => const MyPhysicalFitPDFView(),
          "showLogicChapter1Note": (context) =>
              const MyLogicLectureChapter1View(),
          "showLogicChapter2Note": (context) =>
              const MyLogicLectureChapter2View(),
        },
      ),
    );
  }
}
