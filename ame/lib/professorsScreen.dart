import 'package:ame/professorProfileView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Models/evaluation.dart';
import 'Models/professor.dart';
import 'amecolors.dart';

class ProfessorsScreen extends StatefulWidget {
  @override
  _ProfessorsScreenState createState() => _ProfessorsScreenState();
}

List<Evaluation> evaluations = [
  Evaluation("John", "3.8", initialDescription),
  Evaluation("João", "4.2", initialDescription),
  Evaluation("Sena", "3.9", null),
  Evaluation("Maria", "4.7", initialDescription),
  Evaluation("Fred", "0.2", "sauusahuhsau"),
  Evaluation("Jake", "1.0", initialDescription),
];

class _ProfessorsScreenState extends State<ProfessorsScreen> {
  Professor? _selectedProfessor;
  String? _selectedInstitute;


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

  List<Professor> professors = [
    Professor("João da Silva Rodrigues", "1.2", evaluations),
    Professor("Maria da Silva Rodrigues", "1.2", evaluations),
    Professor("Jorge da Silva Rodrigues", "1.2", evaluations),
    Professor("Rodolfo da Silva Rodrigues", "1.2", evaluations),
    Professor("Emanuel da Silva Rodrigues", "1.2", evaluations),
    Professor("Fred da Silva Rodrigues", "1.2", evaluations),
    Professor("Francisco da Silva Rodrigues", "1.2", evaluations),
    Professor("Roberta da Silva Rodrigues", "1.2", evaluations),
    Professor("Sanderson da Silva Rodrigues", "1.2", evaluations),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(height: 70),
                Container(
                    height: 105,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(children: <Widget>[
                      DropdownButton(
                        hint: Text(
                          "Selecione um instituto...",
                          style: TextStyle(color: AmeColors.primaryBlue.withOpacity(0.6)),
                        ),
                        icon: const Icon(Icons.arrow_drop_down,
                            size: 32, color: AmeColors.primaryBlue),
                        value: _selectedInstitute,
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedInstitute = newValue;
                          });
                        },
                        items: institutes
                            .map((institute) => DropdownMenuItem(
                                value: institute,
                                child: Text(
                                  institute,
                                  style: TextStyle(color: AmeColors.primaryBlue),
                                )))
                            .toList(),
                      ),
                      DropdownButton(
                        hint: Text("Procure um professor...",
                            style:
                                TextStyle(color: AmeColors.primaryBlue.withOpacity(0.6))),
                        icon: const Icon(Icons.search,
                            size: 24, color: AmeColors.primaryBlue),
                        value: _selectedProfessor,
                        isExpanded: true,
                        onChanged: (Professor? newValue) {
                          setState(() {
                            _selectedProfessor = newValue;
                          });
                        },
                        items: professors
                            .map((professor) => DropdownMenuItem(
                                value: professor,
                                child: Text(
                                  professor.name,
                                  style: TextStyle(color: AmeColors.primaryBlue),
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
                          .map<Widget>((professor) => _professorCard(professor))
                          .toList(),
                      //SizedBox(height: 10),
                    )),
              ],
            )));
  }

  _professorCard(Professor professor) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(_routeProfessorProfileView(professor));
          },
          child: Container(
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
                    Container(
                      constraints: BoxConstraints(maxWidth: 220),
                      child: Text(
                        professor.name,
                        style: GoogleFonts.montserrat(
                          color: AmeColors.primaryBlue,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        softWrap: true,
                      ),
                    ),
                    Expanded(flex: 1, child: Container()),
                    Text(professor.rate,
                        style: GoogleFonts.montserrat(
                            color: AmeColors.rateGreen,
                            fontSize: 15,
                            fontWeight: FontWeight.w500)),
                  ])),
        )
      ],
    );
  }

  Route _routeProfessorProfileView(Professor professor) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ProfessorProfileView(professor: professor,),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
