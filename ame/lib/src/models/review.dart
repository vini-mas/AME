class Review {
  String name = "Anônimo";
  String rate = "--";
  String description = "--";

  Review(String? name, String? rate, String? description) {
    this.name = name ?? this.name;
    this.rate = rate ?? this.rate;
    this.description = description ?? this.description;
  }
}
