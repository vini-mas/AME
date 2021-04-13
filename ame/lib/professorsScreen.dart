import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class ProfessorsScreen extends StatefulWidget {
  @override
  _ProfessorsScreenState createState() => _ProfessorsScreenState();
}

class _ProfessorsScreenState extends State<ProfessorsScreen> {
  static const Color blueColor = Color(0xff4361ee);

  List<String> institutes = [
    "Institute 1",
    "Institute 2",
    "Institute 3",
    "Institute 4",
    "Institute 5",
    "Institute 6",
    "Institute 7",
    "Institute 8",
  ];

  List<String> professors = [
    "João da Silva",
    "Maria da Silva",
    "Professor 3",
    "Professor 4",
    "Professor 5",
    "Professor 6",
    "Professor 7",
    "Professor 8",
    "Professor 9",
    "Professor 10",
    "Professor 11",
    "Professor 12",
    "Professor 13",
  ];

  String selectedProfessor;
  String selectedInstitute;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                Container(
                    height: 205,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: <Widget>[
                      SizedBox(height: 100),
                      DropdownButton(
                        hint: Text("Selecione um instituto...", style: TextStyle(color: blueColor.withOpacity(0.6)),),
                        icon: const Icon(Icons.arrow_drop_down,
                            size: 32, color: blueColor),
                        value: selectedInstitute,
                        isExpanded: true,
                        onChanged: (String newValue) {
                          setState(() {
                            selectedInstitute = newValue;
                          });
                        },
                        items: institutes
                            .map((institute) => DropdownMenuItem(
                                value: institute,
                                child: Text(
                                  institute,
                                  style: TextStyle(color: blueColor),
                                )))
                            .toList(),
                      ),
                      DropdownButton(
                        hint: Text("Procure um professor...", style: TextStyle(color: blueColor.withOpacity(0.6))),
                        icon: const Icon(Icons.search,
                            size: 24, color: blueColor),
                        value: selectedProfessor,
                        isExpanded: true,
                        onChanged: (String newValue) {
                          setState(() {
                            selectedProfessor = newValue;
                          });
                        },
                        items: professors
                            .map((professor) => DropdownMenuItem(
                            value: professor,
                            child: Text(
                              professor,
                              style: TextStyle(color: blueColor),
                            )))
                            .toList(),
                      ),
                    ])),
                Container(
                    height: 550,
                    child: ListView(
                      //https://api.flutter.dev/flutter/widgets/ListView-class.html
                      padding: EdgeInsets.only(bottom: 10),
                      shrinkWrap: true,
                      children: professors
                          .map<Widget>((name) => _buildTextField(name, ""))
                          .toList(),
                      //SizedBox(height: 10),
                    )),
              ],
            )));
  }

  _buildTextField(String name, String rate) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 50,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 6,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(name, style: TextStyle(color: blueColor, fontSize: 16, fontWeight: FontWeight.w400))
                ]))
      ],
    );
  }
}
