import 'package:ame/professorsScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AME',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Color purpleColor = Color(0xff9d4edd);
  Color blueColor = Color(0xff4361ee);
  Color salmonColor = Color(0xffff6584);
  Color greenColor = Color(0xff65ae28);

  Color whiteColor = Color(0xffffffff);

  Color green2Color = Color(0xff89cf4e);
  Color yellowColor = Color(0xffffb843);
  Color redColor = Color(0xfffe2e55);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
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
                      style: TextStyle(color: blueColor, fontSize: 70, fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        "Aperfeiçoamento do\nMeio Estudantil",
                        textAlign: TextAlign.right,
                        style: TextStyle(color: blueColor, fontSize: 16, fontFamily: 'Montserrat', fontWeight: FontWeight.w500),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 300),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: blueColor,
                    onPrimary: whiteColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    minimumSize: Size(350, 50),
                    textStyle: TextStyle(fontSize: 16)
                  ),
                  onPressed: () {
                    Navigator.of(context).push(_routeLoginScreen());
                  },
                  child: Text('Começar'),
              )
            ],
          ),
        )
    );
  }
  Route _routeLoginScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ProfessorsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

}
