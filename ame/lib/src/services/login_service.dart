import 'dart:convert';

import 'package:ame/src/models/service_response.dart';
import 'package:ame/src/models/user.dart';

import 'base_service.dart';

class LoginService extends BaseService {
  final String user;
  final String password;

  LoginService(this.user, this.password) : super('/login');

  //Add credentials on requisition
  Future<ServiceResponse<User>> fetchUser() async {
    final response = await this.get();

    if (response.statusCode == 200) {
      final data = User.fromJson(jsonDecode(response.body));
      return Future.value(ServiceResponse(data, null));
    } else
      return Future.value(ServiceResponse(null, "Failed to Login"));
  }
}
