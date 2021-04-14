import 'package:flutter/cupertino.dart';

List<String> initialInstitutes = [
  "Instituto de Informática",
];

class InstituteProvider with ChangeNotifier {
  List<String> _institutes = initialInstitutes;

  List<String> get institutes => _institutes;
  set institutes(List<String> institutes) {
    _institutes = institutes;
    notifyListeners();
  }
}
