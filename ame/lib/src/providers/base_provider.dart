import 'package:flutter/foundation.dart';

class BaseProvider with ChangeNotifier {
  String? message;
  bool isLoading = false;
}
