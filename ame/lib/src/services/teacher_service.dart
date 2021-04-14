import 'dart:convert';

import 'package:ame/src/models/teacher.dart';
import 'package:http/http.dart' as http;

class TeacherService {
  Future<List<Teacher>> fetchTeachers() async {
    final response =
        await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums/1'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["teachers"]
          .map((teacher) => Teacher.fromJson(jsonDecode(teacher)));
    } else {
      throw Exception('Failed to load teachers');
    }
  }
}
