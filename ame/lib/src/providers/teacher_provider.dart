import 'package:ame/src/models/teacher.dart';
import 'package:ame/src/services/teacher_service.dart';
import 'package:diacritic/diacritic.dart';

import 'base_provider.dart';

class TeacherProvider extends BaseProvider {
  List<Teacher> _teachers = [];
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
      if (removeDiacritics(teacher.user.name.toLowerCase())
          .contains(removeDiacritics(_searchTerm.toLowerCase())))
        filteredTeachers.add(teacher);
    });

    return filteredTeachers;
  }
}
