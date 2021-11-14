import 'package:flutter/cupertino.dart';

class Balance with ChangeNotifier {
  int _amount = 10000;

  int get amount => _amount;

  set amount(int value) {
    _amount = value;

    notifyListeners();
  }
}
