import 'package:ame/src/models/teacher.dart';
import 'package:ame/src/screens/teacher_profile/widgets/teacher_profile_card.dart';
import 'package:ame/src/screens/teacher_profile/widgets/teacher_review_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherProfileScreen extends StatefulWidget {
  final Teacher teacher;

  TeacherProfileScreen({Key? key, required this.teacher}) : super(key: key);

  _TeacherProfileScreenState createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 36),
            child: Column(children: <Widget>[
              SizedBox(
                height: 70,
              ),
              TeacherProfileCard(
                teacher: widget.teacher,
              ),
              SizedBox(height: 8),
              Expanded(
                  flex: 1,
                  child: Container(
                      child: ListView(
                    padding: EdgeInsets.only(bottom: 36),
                    shrinkWrap: true,
                    children: (widget.teacher.reviews)
                        .map<Widget>(
                            (review) => TeacherReviewCard(review: review))
                        .toList(),
                  ))),
            ])));
  }
}
