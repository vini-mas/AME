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
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Text(
                                review.name,
                                style: GoogleFonts.montserrat(
                                  color: AmeColors.primaryBlue,
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Container(
                            width: 40,
                            child: Text(
                              review.rate,
                              textAlign: TextAlign.right,
                              style: GoogleFonts.montserrat(
                                  color: AmeColors.getRatingColor(review.rate),
                                  fontSize: 16),
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        padding:
                            EdgeInsets.only(left: 5, right: 20, bottom: 10),
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
                        )),
                  )
                ],
              )),
        )
      ],
    );
  }
}
