import 'package:ame/src/models/review.dart';
import 'package:ame/src/styles/ame_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherReviewCard extends StatelessWidget {
  final Review review;
  TeacherReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 8),
        Expanded(
          flex: 0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 130,
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
                        Text(
                          review.rate,
                          style: GoogleFonts.montserrat(
                              color: AmeColors.getRatingColor(review.rate),
                              fontSize: 16),
                        ),
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
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          )
                        ],
                      ))
                ],
              )),
        )
      ],
    );
  }
}
