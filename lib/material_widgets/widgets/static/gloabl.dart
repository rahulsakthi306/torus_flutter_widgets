import 'package:flutter/material.dart';

class DateTimeState extends ChangeNotifier {
  static DateTime? _dateTime;

  DateTime? get dateTime => _dateTime;

  set dateTime(DateTime? newDateTime) {
    _dateTime = newDateTime;
    notifyListeners();
  }
}

class FormControl{
  static bool? test_switch = false;
}
