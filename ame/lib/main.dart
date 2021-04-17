import 'package:ame/src/providers/teacher_provider.dart';
import 'package:ame/src/screens/welcome/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => TeacherProvider(),
          )
        ],
        child: MaterialApp(
          title: 'AME',
          theme: ThemeData(),
          home: WelcomeScreen(),
        ));
  }
}
