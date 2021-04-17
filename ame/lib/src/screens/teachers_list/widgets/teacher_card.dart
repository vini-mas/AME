import 'package:ame/src/models/teacher.dart';
import 'package:ame/src/providers/teacher_provider.dart';
import 'package:ame/src/screens/teacher_profile/teacher_profile_screen.dart';
import 'package:ame/src/styles/ame_colors.dart';
import 'package:ame/src/utils/nav_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeacherCard extends StatelessWidget {
  final Teacher teacher;
  TeacherCard({Key? key, required this.teacher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TeacherProvider>(
      builder: (context, teacherProvider, _) => Column(
        children: <Widget>[
          SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              NavUtils(context)
                  .pushScreen(TeacherProfileScreen(teacher: teacher));
            },
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 50,
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
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Text(
                                  teacher.user.name,
                                  style: GoogleFonts.montserrat(
                                    color: AmeColors.primaryBlue,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Container(
                                width: 40,
                                child: Text(
                                    teacher.rate == null
                                        ? '--'
                                        : teacher.rate.toString(),
                                    textAlign: TextAlign.right,
                                    style: GoogleFonts.montserrat(
                                        color: AmeColors.getRatingColor(
                                            teacher.rate),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500))),
                          ])),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
