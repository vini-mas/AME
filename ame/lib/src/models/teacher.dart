import 'package:ame/src/models/user.dart';

import 'review.dart';

class Teacher {
  final int id;
  final int institute;
  final String lattesLink;
  final double? rate;
  final User user;
  final List<Review> reviews;

  Teacher(this.id, this.institute, this.lattesLink, this.rate, this.user,
      this.reviews);

  Map toJson() => {
        'institute': institute,
        'rate': rate,
        'reviews': reviews,
      };

  Teacher.fromJson(Map json)
      : id = json['id'],
        institute = int.parse(json['institute']),
        rate = json['rate'],
        lattesLink = json['lattesLink'] == null ? '' : json['lattesLink'],
        user = User.fromJson(json['user']),
        reviews = json['reviews']
            .map((review) => Review.fromJson(review))
            .toList()
            .cast<Review>();
}
