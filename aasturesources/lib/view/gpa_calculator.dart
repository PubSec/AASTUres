import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart' as line;

class MyGPACalculatorView extends StatefulWidget {
  const MyGPACalculatorView({super.key});

  @override
  State<MyGPACalculatorView> createState() => _MyGPACalculatorViewState();
}

class _MyGPACalculatorViewState extends State<MyGPACalculatorView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'GPA Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: const line.LineIcon.accusoft(
          size: 29,
          color: Colors.white,
        ),
      ),
    );
  }
}
