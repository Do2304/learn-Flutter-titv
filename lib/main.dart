import 'package:flutter/material.dart';
import 'widget_01/myScaffold.dart';
import 'widget_01/myAppBar.dart';
import 'widget_01/myText.dart';
import 'widget_01/myContainer.dart';
import 'widget_01/myColumnAndRow.dart';
import 'widget_01/myButton.dart';
import 'widget_01/myButton_2.dart';
import 'widget_01/myGestures.dart';
import 'widget_01/myTextField.dart';
import 'widget_01/myTextField_2.dart';

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
      home: myTextField_2(),
    );
  }
}
