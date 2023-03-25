import 'dart:math';

import 'package:doclink/data/data%20source/doctor_remote_data_source.dart';
import 'package:doclink/domain/entities/doctor.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/state_providers.dart';
import 'specialties_map.dart';

void searchForSpecialties(
    WidgetRef ref, TextEditingController searchController) {
  final results = <String, Map<String, String>>{};
  final searchText = searchController.value.text.toLowerCase();
  final searchTextLength = searchText.length;

  for (var medicalEntry in medicalSpecialties.entries) {
    String complexName = medicalEntry.key.toLowerCase();
    String simpleName = medicalEntry.value['name']!.toLowerCase();
    bool complexNameFound = false;

    for (int complexIndex = 0;
        complexIndex < complexName.length;
        complexIndex++) {
      if (searchTextLength > complexName.length - complexIndex) {
        break;
      }

      if (complexName.substring(
            complexIndex,
            complexIndex + searchTextLength,
          ) ==
          searchText) {
        results[medicalEntry.key] = medicalEntry.value;
        complexNameFound = true;
        break;
      }
    }

    if (complexNameFound) continue;

    for (int simpleIndex = 0; simpleIndex < simpleName.length; simpleIndex++) {
      if (searchTextLength > simpleName.length - simpleIndex) {
        break;
      }
      if (simpleName.substring(simpleIndex, simpleIndex + searchTextLength) ==
          searchText) {
        results[medicalEntry.key] = medicalEntry.value;
        break;
      }
    }
  }
  ref.read(specialtiesSearchResults.notifier).update((state) => results);
}

void searchForDoctors(WidgetRef ref, TextEditingController searchController) {
  final results = <Doctor>[];
  final searchText = searchController.value.text.toLowerCase();
  final doctorsList = ref.read(doctorsNotifierProvider).value!
    ..sort(
      (a, b) => a.name.compareTo(b.name),
    );

  int low = 0, high = doctorsList.length - 1, firstMatchedIndex = -1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    bool contains = doctorsList[mid].name.toLowerCase().contains(searchText);
    if (contains) {
      firstMatchedIndex = mid;
      high = mid - 1;
    } else {
      int comparison =
          doctorsList[mid].name.toLowerCase().compareTo(searchText);
      if (comparison > 0) {
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }
  }

  if (firstMatchedIndex == -1) {
    return;
  }
  low = 0;
  high = doctorsList.length - 1;
  int lastMatchedIndex = -1;

  while (low <= high) {
    int mid = (low + high) ~/ 2;
    bool contains = doctorsList[mid].name.toLowerCase().contains(searchText);
    if (contains) {
      lastMatchedIndex = mid;
      low = mid + 1;
    } else {
      int comparison =
          doctorsList[mid].name.toLowerCase().compareTo(searchText);
      if (comparison > 0) {
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }
  }
  if (firstMatchedIndex == lastMatchedIndex) {
    results.add(doctorsList[firstMatchedIndex]);
    ref.read(doctorSearchResults.notifier).update((state) => results);
    return;
  }

  for (int i = firstMatchedIndex;
      i <= min(lastMatchedIndex, lastMatchedIndex + 10);
      i++) {
    if (doctorsList[i].name.toLowerCase().contains(searchText)) {
      results.add(doctorsList[i]);
    }
  }

  results.sort(
    (a, b) => a.name.toLowerCase().compareTo(searchText),
  );
  ref.read(doctorSearchResults.notifier).update((state) => results);
}
