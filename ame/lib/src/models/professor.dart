import 'evaluation.dart';

class Professor {
  String name = "--";
  String rate = "--";
  List<Evaluation> evaluations = [];

  Professor(String name, String? rate, List<Evaluation>? evaluations) {
    this.name = name;
    this.rate = rate ?? this.rate;
    this.evaluations = evaluations ?? [];
  }
}