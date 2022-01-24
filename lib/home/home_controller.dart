import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  final textController = TextEditingController();

  String? error;
  bool _isValid = true;
  final List<int> _list = [];
  int _result = 0;
  bool _showResult = false;
  bool _showError = false;

  bool get isValid => _isValid;
  bool get showResult => _showResult;
  bool get showError => _showError;
  int get result => _result;

  Future<void> validateTextField() async {
    if (textController.text.isEmpty) {
      error = 'Campo obrigatório';
      _isValid = false;
      notifyListeners();
    }
  }

  summationAllvalues() {
    try {
      int value = int.parse(textController.text);

      for (int i = 0; i <= value; i++) {
        if (i % 5 == 0) {
          _list.add(i);
        } else if (i % 3 == 0) {
          _list.add(i);
        }
        if (i == value) {
          _list.remove(i);
        }
      }
      sumOfValues();
      clearValues();

      _showError = false;
      _showResult = true;
      notifyListeners();
    } catch (e) {
      _showError = true;
      _showResult = false;
      notifyListeners();
    }
  }

  void sumOfValues() {
    _result = 0;

    for (int i = 0; i < _list.length; i++) {
      _result = result + _list[i];
    }
    notifyListeners();
  }

  void clearValues() {
    _list.clear();
  }

  String? errorText(bool valid, String? error) {
    if (valid) {
      return error;
    } else {
      error = 'Campo obrigatório';
      notifyListeners();
      return error;
    }
  }
}
