import 'package:ame/nav_bar.dart';
import 'package:ame/src/styles/ame_colors.dart';
import 'package:ame/src/styles/ame_size.dart';
import 'package:ame/src/utils/nav_utils.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AmeColors.white,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AmeSize.getSideSpacing(context)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Column(
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
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AmeColors.primaryBlue,
                      onPrimary: AmeColors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      minimumSize: Size(double.infinity, 50),
                      textStyle: TextStyle(fontSize: 16)),
                  onPressed: () {
                    NavUtils(context).pushScreen(NavBar());
                  },
                  child: Text('Começar'),
                )
              ],
            ),
          ),
        ));
  }
}
