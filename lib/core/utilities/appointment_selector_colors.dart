import 'package:flutter/material.dart';

import '../../presentation/screens/home_screens/book_appointment.dart';

Map colors(ColorScheme colorScheme) {
  return {
    TimeStates.disabled: {
      'text': Colors.grey,
      'container': colorScheme.background,
      'border': Colors.grey,
    },
    TimeStates.selected: {
      'text': colorScheme.onPrimary,
      'container': colorScheme.primary,
      'border': colorScheme.primary,
    },
    TimeStates.available: {
      'text': colorScheme.primary,
      'container': colorScheme.background,
      'border': colorScheme.primary,
    },
  };
}