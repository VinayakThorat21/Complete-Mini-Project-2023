import 'package:flutter/material.dart';
import 'conduct_test/test_screen.dart';

void main(List<String> args) {
  runApp(const CarePlus());
}

class CarePlus extends StatelessWidget {
  const CarePlus({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CarePlus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const TestScreen(
        title: 'CarePlus',
      ),
    );
  }
}
