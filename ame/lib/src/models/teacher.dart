import 'review.dart';

class Teacher {
  final String name;
  final String rate;
  final List<Review> reviews;

  Teacher(this.name, this.rate, this.reviews);

  Map toJson() => {
        'name': name,
        'rate': rate,
        'reviews': reviews,
      };

  Teacher.fromJson(Map json)
      : name = json['name'],
        rate = json['rate'],
        reviews = json['reviews'];
}
