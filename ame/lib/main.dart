import 'package:ame/src/screens/teacher_list_screen.dart';
import 'package:ame/src/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'AME', theme: ThemeData(), routes: {
      '/': (context) => WelcomeScreen(),
      TeacherListScreen.routeName: (context) => TeacherListScreen(),
    });
  }
}
