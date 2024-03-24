import 'package:flutter/material.dart';
import 'rekenmachine.dart';

void main() {
  runApp(const MyAppPage());
}

class MyAppPage extends StatelessWidget {
  const MyAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const RekenmachinePage(),
    );
  }
}
