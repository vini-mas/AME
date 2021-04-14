import 'package:ame/src/styles.dart';
import 'package:ame/src/screens/teacher_list_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AmeColors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(height: 150),
              SizedBox(
                height: 150,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'AME',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: AmeColors.primaryBlue,
                          fontSize: 70,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        "Aperfeiçoamento do\nMeio Estudantil",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: AmeColors.primaryBlue,
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 300),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AmeColors.primaryBlue,
                    onPrimary: AmeColors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    minimumSize: Size(350, 50),
                    textStyle: TextStyle(fontSize: 16)),
                onPressed: () {
                  Navigator.of(context).pushNamed(TeacherListScreen.routeName);
                },
                child: Text('Começar'),
              )
            ],
          ),
        ));
  }
}
