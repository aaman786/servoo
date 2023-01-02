import 'package:flutter/cupertino.dart';

class GeneralProvider extends ChangeNotifier {
  bool serviceFound = true;

  void setServiceFound(bool val) {
    serviceFound = val;
    notifyListeners();
  }
}
