import 'package:flutter/material.dart';
import 'myScaffold.dart';
import 'myAppBar.dart';
import 'myText.dart';
import 'myContainer.dart';
import 'myColumnAndRow.dart';
import 'myButton.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: myButton(),
    );
  }
}
