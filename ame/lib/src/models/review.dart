import 'package:ame/src/models/user.dart';

class Review {
  final User student;
  final double rate;
  final String description;

  Review(this.student, this.rate, this.description);

  Review.fromJson(Map json)
      : student = User.fromJson(json['student']),
        rate = json['rate'],
        description = json['description'];
}
