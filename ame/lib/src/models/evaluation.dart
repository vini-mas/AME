class Evaluation {
  String name = "Anônimo";
  String rate = "--";
  String description = "--";

  Evaluation(String? name, String? rate, String? description) {
    this.name = name ?? this.name;
    this.rate = rate ?? this.rate;
    this.description = description ?? this.description;
  }
}