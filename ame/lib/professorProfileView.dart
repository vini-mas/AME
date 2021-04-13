import 'package:ame/Models/professor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Models/evaluation.dart';
import 'amecolors.dart';

class ProfessorProfileView extends StatefulWidget {
  final Professor professor;

  ProfessorProfileView({Key? key, required this.professor}) : super(key: key);

  _ProfessorProfileViewState createState() => _ProfessorProfileViewState();
}

String initialDescription =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

class _ProfessorProfileViewState extends State<ProfessorProfileView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Column(children: <Widget>[
              SizedBox(
                height: 70,
              ),
              _professorCard(),
              SizedBox(height: 10),
              Container(
                  height: 550,
                  child: ListView(
                    //https://api.flutter.dev/flutter/widgets/ListView-class.html
                    padding: EdgeInsets.only(bottom: 10),
                    shrinkWrap: true,
                    children: (widget.professor?.evaluations ?? [])
                        .map<Widget>(
                            (evaluation) => _evaluationCard(evaluation))
                        .toList(),
                    //SizedBox(height: 10),
                  )),
            ])));
  }

  _professorCard() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 90,
        width: 360,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 6,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxWidth: 220),
                child: Text(
                  widget.professor?.name ?? "--",
                  style: GoogleFonts.montserrat(
                    color: AmeColors.primaryBlue,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Text(widget.professor?.rate ?? "--",
                  style: GoogleFonts.montserrat(
                      color: AmeColors().getRatingColor(widget.professor?.rate ?? "5.0"),
                      fontSize: 24,
                      fontWeight: FontWeight.w400)),
            ]));
  }

  _evaluationCard(Evaluation evaluation) {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 130,
            width: 360,
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
            child: Column(
              children: <Widget>[
                SizedBox(height: 18),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 220),
                        child: Text(
                          evaluation.name,
                          style: GoogleFonts.montserrat(
                            color: AmeColors.primaryBlue,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                      Text(evaluation.rate,
                          style: GoogleFonts.montserrat(
                              color: AmeColors().getRatingColor(evaluation.rate), fontSize: 16)),
                    ]),
                SizedBox(height: 6),
                Container(
                    constraints: BoxConstraints(maxWidth: 240, maxHeight: 70),
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            evaluation.description,
                            style: GoogleFonts.montserrat(
                              color: AmeColors.lightGray,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            softWrap: true,
                          ),
                        )
                      ],
                    ))
              ],
            ))
      ],
    );
  }
}
