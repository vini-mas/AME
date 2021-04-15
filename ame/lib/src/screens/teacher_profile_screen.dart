import 'package:ame/src/models/teacher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/review.dart';
import '../styles/ame_colors.dart';

class TeacherProfileScreen extends StatefulWidget {
  final Teacher teacher;

  TeacherProfileScreen({Key? key, required this.teacher}) : super(key: key);

  _TeacherProfileScreenState createState() => _TeacherProfileScreenState();
}

String initialDescription =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {
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
              _teacherCard(),
              SizedBox(height: 10),
              Container(
                  height: 550,
                  child: ListView(
                    padding: EdgeInsets.only(bottom: 10),
                    shrinkWrap: true,
                    children: (widget.teacher.reviews)
                        .map<Widget>((review) => _reviewCard(review))
                        .toList(),
                  )),
            ])));
  }

  _teacherCard() {
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
                offset: Offset(0, 3),
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
                  widget.teacher.name,
                  style: GoogleFonts.montserrat(
                    color: AmeColors.primaryBlue,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  softWrap: true,
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Text(widget.teacher.rate,
                  style: GoogleFonts.montserrat(
                      color: AmeColors().getRatingColor(widget.teacher.rate),
                      fontSize: 24,
                      fontWeight: FontWeight.w400)),
            ]));
  }

  _reviewCard(Review review) {
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
                    offset: Offset(0, 3),
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
                          review.name,
                          style: GoogleFonts.montserrat(
                            color: AmeColors.primaryBlue,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                      Text(review.rate,
                          style: GoogleFonts.montserrat(
                              color: AmeColors().getRatingColor(review.rate),
                              fontSize: 16)),
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
                            review.description,
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
