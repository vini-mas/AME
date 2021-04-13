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

List<String> institutes = [
  "Instituto de Informática",
  "Instituto 2",
  "Instituto 3",
];

List<Professor> professors = [
  Professor("João da Silva Rodrigues", "1.7", evaluations),
  Professor("Maria da Silva Rodrigues", "4.2", evaluations),
  Professor("Jorge da Silva Rodrigues", "3.2", evaluations),
  Professor("Rodolfo da Silva Rodrigues", "5.0", evaluations),
  Professor("Emanuel da Silva Rodrigues", "4.7", evaluations),
  Professor("Fred da Silva Rodrigues", "2.3", evaluations),
  Professor("Francisco da Silva Rodrigues", "3.4", evaluations),
  Professor("Roberta da Silva Rodrigues", "4.4", evaluations),
  Professor("Sanderson da Silva Rodrigues", "4.1", evaluations),
];

class _ProfessorsScreenState extends State<ProfessorsScreen> {
  String _selectedProfessor = "";
  String? _selectedInstitute;
  List<Professor> _filteredProfessors = professors;

  void setFilteredProfessors(String search)  {
    List<Professor> filteredProfessors = [];

    professors.forEach((professor) {
      if (professor.name
          .toLowerCase()
          .contains(search.toLowerCase()) ||
          professor.name
              .toLowerCase()
              .contains(search.toLowerCase()))
        filteredProfessors.add(professor);
    });

    setState(() {
      _filteredProfessors = filteredProfessors;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: <Widget>[
                SizedBox(height: 70),
                Container(
                    height: 105,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(children: <Widget>[
                      Container(
                          height: 40,
                          child: Material(
                              elevation: 6,
                              shadowColor: Colors.grey.withOpacity(0.8),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                      alignedDropdown: true,
                                      child: DropdownButton(
                                        hint: Text(
                                          "Selecione um instituto...",
                                          style: TextStyle(
                                              color: AmeColors.primaryBlue
                                                  .withOpacity(0.6),
                                              fontSize: 15),
                                        ),
                                        icon: const Icon(Icons.arrow_drop_down,
                                            size: 32,
                                            color: AmeColors.primaryBlue),
                                        value: _selectedInstitute,
                                        isExpanded: true,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            _selectedInstitute = newValue;
                                          });
                                        },
                                        style: TextStyle(),
                                        items: institutes
                                            .map(
                                                (institute) => DropdownMenuItem(
                                                    value: institute,
                                                    child: Text(
                                                      institute,
                                                      style: TextStyle(
                                                          color: AmeColors
                                                              .primaryBlue),
                                                    )))
                                            .toList(),
                                      ))))),
                      SizedBox(height: 10),
                      Container(
                          height: 40,
                          child: Material(
                            elevation: 6,
                            shadowColor: Colors.grey.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                hintText: 'Procure um professor...',
                                hintStyle:
                                    TextStyle(color: AmeColors.primaryBlue),
                                suffixIcon: const Icon(Icons.search,
                                    size: 24, color: AmeColors.primaryBlue),
                              ),
                              style: TextStyle(
                                  color: AmeColors.primaryBlue, fontSize: 15),
                              onChanged: (String newValue) {
                                setState(() {
                                  _selectedProfessor = newValue;
                                  setFilteredProfessors(newValue);
                                });
                              },
                            ),
                          )),
                    ])),
                Container(
                    height: 550,
                    child: ListView.builder(
                      itemCount: _filteredProfessors.length,
                      itemBuilder: (_, i) {
                        return ListTile(
                          title: _professorCard(_filteredProfessors[i]),
                        );
                      },
                      padding: EdgeInsets.only(bottom: 10),
                      shrinkWrap: true,
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
                            color: AmeColors().getRatingColor(professor.rate),
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
          ProfessorProfileView(
        professor: professor,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }
}
