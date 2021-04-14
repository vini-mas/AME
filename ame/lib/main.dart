import 'package:ame/src/screens/teacher_list_screen.dart';
import 'package:ame/src/screens/welcome_screen.dart';
import 'package:ame/src/providers/teacher_provider.dart';
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
        child: MaterialApp(title: 'AME', theme: ThemeData(), routes: {
          '/': (context) => WelcomeScreen(),
          TeacherListScreen.routeName: (context) => TeacherListScreen(),
        }));
  }
}
