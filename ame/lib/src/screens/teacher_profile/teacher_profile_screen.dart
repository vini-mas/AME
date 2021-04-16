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

String initialDescription =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

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
