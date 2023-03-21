import 'package:flutter/material.dart';

import '../consts/date_of_birth_consts.dart';

void leapYearCalculator(ValueNotifier<List<int?>> dateOfBirth,
    ValueNotifier<List<int>> daySelectionList) {
  final DOB = dateOfBirth.value;
  if (DOB[0] == null || DOB[1] == null) return;
  final year = DOB[0]!;
  final month = DOB[1]!;
  if (((year % 4 == 0 && year % 100 != 0) ||
          (year % 4 == 0 && year % 100 == 0 && year % 400 == 0)) &&
      month == 2) {
    daySelectionList.value = List.from(
      days.map((e) {
        if (e == 28) {
          return 29;
        } else {
          return e;
        }
      }),
    );
  }
}
