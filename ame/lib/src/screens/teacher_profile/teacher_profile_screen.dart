import 'package:ame/src/models/teacher.dart';
import 'package:ame/src/providers/teacher_provider.dart';
import 'package:ame/src/screens/teacher_profile/widgets/teacher_profile_card.dart';
import 'package:ame/src/screens/teacher_profile/widgets/teacher_review_card.dart';
import 'package:ame/src/styles/ame_colors.dart';
import 'package:ame/src/styles/ame_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherProfileScreen extends StatefulWidget {
  static const String routeName = '/teacher_profile_screen';

  final Teacher teacher;
  TeacherProfileScreen({Key? key, required this.teacher}) : super(key: key);

  _TeacherProfileScreenState createState() => _TeacherProfileScreenState();
}

class _TeacherProfileScreenState extends State<TeacherProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TeacherProvider>(
      builder: (context, teacherProvider, _) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: 8,
                        left: AmeSize.getSideSpacing(context),
                        right: AmeSize.getSideSpacing(context)),
                    child: Column(children: <Widget>[
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
                            children: widget.teacher.reviews.isEmpty
                                ? [Text("Sem avaliações disponíveis")]
                                : (widget.teacher.reviews)
                                    .map<Widget>((review) =>
                                        TeacherReviewCard(review: review))
                                    .toList(),
                          ))),
                    ])),
                Positioned(
                  left: AmeSize.getWidth(context) * 3 / 4,
                  top: AmeSize.getHeight(context) * 4 / 5 - 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AmeColors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        minimumSize: Size(70, 70),
                        padding: EdgeInsets.all(0)),
                    onPressed: () {},
                    child: Icon(
                      Icons.add_rounded,
                      size: 60,
                      color: AmeColors.primaryBlue,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
