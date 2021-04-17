import 'package:ame/src/models/review.dart';
import 'package:ame/src/models/teacher.dart';
import 'package:ame/src/services/teacher_service.dart';
import 'package:diacritic/diacritic.dart';

import 'base_provider.dart';

String initialDescription =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

List<Review> initialReviews = [
  Review("John", "3.8", initialDescription),
  Review("João", "4.2", initialDescription),
  Review("Sena", "3.9", "--"),
  Review("Maria", "4.7", initialDescription),
  Review("Fred", "0.2", "sauusahuhsau"),
  Review("Jake", "1.0", initialDescription),
];

List<Teacher> initialTeachers = [
  Teacher(
      "João da Silva Rodrigues da Silva Rodrigues da Silva Rodrigues da Silva Rodrigues",
      "1.7",
      initialReviews),
  Teacher("Maria da Silva Rodrigues", "4.2", initialReviews),
  Teacher("Jorge da Silva Rodrigues", "3.2", initialReviews),
  Teacher("Rodolfo da Silva Rodrigues", "5.0", initialReviews),
  Teacher("Emanuel da Silva Rodrigues", "4.7", initialReviews),
  Teacher("Fred da Silva Rodrigues", "2.3", initialReviews),
  Teacher("Francisco da Silva Rodrigues", "3.4", initialReviews),
  Teacher("Roberta da Silva Rodrigues", "4.4", initialReviews),
  Teacher("Sanderson da Silva Rodrigues", "4.1", initialReviews),
  Teacher("Sanderson da Silva Rodrigues", "4.1", initialReviews),
  Teacher("Sanderson da Silva Rodrigues", "4.1", initialReviews),
  Teacher("Sanderson da Silva Rodrigues", "4.1", initialReviews),
  Teacher("Sanderson da Silva Rodrigues", "4.1", initialReviews),
  Teacher("Sanderson da Silva Rodrigues", "4.1", initialReviews),
  Teacher("Sanderson da Silva Rodrigues", "4.1", initialReviews),
  Teacher("Sanderson da Silva Rodrigues", "4.1", initialReviews),
  Teacher("Sanderson da Silva Rodrigues", "4.1", initialReviews),
];

class TeacherProvider extends BaseProvider {
  List<Teacher> _teachers = initialTeachers;
  String _searchTerm = "";

  void fetchTeachers() async {
    this.isLoading = true;
    notifyListeners();

    final response = TeacherService().fetchTeachers().then((response) {
      _teachers = response.data ?? [];
      this.message = response.message;
    });

    await response;

    this.isLoading = false;
    notifyListeners();
  }

  List<Teacher> get teachers => _teachers;
  set teachers(List<Teacher> teachers) {
    _teachers = teachers;
    notifyListeners();
  }

  String? get searchTerm => _searchTerm;
  set searchTerm(String? searchTerm) {
    if (searchTerm != null)
      _searchTerm = searchTerm;
    else
      _searchTerm = "";
    notifyListeners();
  }

  List<Teacher> get filteredTeachers => _getFilteredTeachers();
  List<Teacher> _getFilteredTeachers() {
    List<Teacher> filteredTeachers = [];

    if (_searchTerm == "") return _teachers;

    _teachers.forEach((teacher) {
      if (removeDiacritics(teacher.name.toLowerCase())
          .contains(removeDiacritics(_searchTerm.toLowerCase())))
        filteredTeachers.add(teacher);
    });

    return filteredTeachers;
  }
}
