import 'package:ame/src/models/teacher.dart';
import 'package:ame/src/styles/ame_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherProfileCard extends StatelessWidget {
  final Teacher teacher;
  TeacherProfileCard({Key? key, required this.teacher}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 90),
            painter: _TeacherProfileCardPainter(),
          ),
          Container(
              height: 90,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
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
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Container(
                      width: 45,
                      child: Text(
                          teacher.rate == null ? "--" : teacher.rate.toString(),
                          textAlign: TextAlign.right,
                          style: GoogleFonts.montserrat(
                              color: AmeColors.getRatingColor(teacher.rate),
                              fontSize: 24,
                              fontWeight: FontWeight.w400)),
                    ),
                  ])),
        ],
      ),
    );
  }
}

class _TeacherProfileCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = AmeColors.primaryBlue
      ..style = PaintingStyle.fill;
    double moveVertical = 4.5;
    double moveHorizontal = 0.1;

    Path path = Path();
    path.moveTo(-moveHorizontal, size.height + moveVertical - 30); // Start
    path.lineTo(-moveHorizontal, size.height + moveVertical - 20);
    path.arcToPoint(Offset(20, size.height + moveVertical),
        radius: Radius.circular(20.0), clockwise: false); //left bottom
    path.lineTo(30, size.height + moveVertical);
    path.lineTo(size.width - 20, size.height + moveVertical);
    path.arcToPoint(
        Offset(size.width + moveHorizontal, size.height + moveVertical - 20),
        radius: Radius.circular(20.0),
        clockwise: false); //right bottom

    path.lineTo(size.width, size.height + moveVertical);
    path.lineTo(size.width + moveHorizontal, size.height - 30 + moveVertical);
    path.lineTo(size.width, size.height - 30 + moveVertical);

    path.lineTo(size.width, 20);

    path.arcToPoint(Offset(size.width - 20, 0),
        radius: Radius.circular(20.0), clockwise: false); //right top

    path.lineTo(20, 0);

    path.arcToPoint(Offset(0, 20),
        radius: Radius.circular(20.0), clockwise: false); //left top

    path.lineTo(0, size.height + moveVertical - 30);

    canvas.drawShadow(path, Colors.black, 5, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
