import 'review.dart';

class Teacher {
  String name = "--";
  String rate = "--";
  List<Review> reviews = [];

  Teacher(String name, String? rate, List<Review>? reviews) {
    this.name = name;
    this.rate = rate ?? this.rate;
    this.reviews = reviews ?? [];
  }
}
