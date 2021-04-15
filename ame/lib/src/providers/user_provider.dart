import 'package:ame/src/models/user.dart';
import 'package:ame/src/services/login_service.dart';
import 'base_provider.dart';

class UserProvider extends BaseProvider {
  User? _user;
  bool _isUser = false;

  Future<bool> fetchUser(String login, String password) async {
    this.isLoading = true;
    notifyListeners();

    final response = LoginService(login, password).fetchUser().then((response) {
      _user = response.data;
      this.message = response.message;
      _isUser = response.data != null;
    });

    await response;

    this.isLoading = false;
    notifyListeners();

    return _isUser;
  }

  User? get user => _user;

  get isUser => _isUser;
}
