import 'dart:convert';

import 'package:ame/src/models/service_response.dart';
import 'package:ame/src/models/teacher.dart';
import 'package:ame/src/services/base_service.dart';

class TeacherService extends BaseService {
  TeacherService() : super('teacher/');

  Future<ServiceResponse<List<Teacher>>> fetchTeachers() async {
    List<Teacher> teachers = [];

    final response = await this.get(path: 'getTeachers');

    if (response.statusCode == 200) {
      for (Map i in jsonDecode(response.body))
        teachers.add(Teacher.fromJson(i));
      return Future.value(ServiceResponse(teachers, null));
    } else
      return Future.value(ServiceResponse(null, "Failed to fetch Teachers"));
  }
}
