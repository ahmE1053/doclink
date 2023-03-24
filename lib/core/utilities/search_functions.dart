import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/state_providers.dart';
import 'specialties_map.dart';

void searchForSpecialties(
    WidgetRef ref, TextEditingController searchController) {
  final results = <String, Map<String, String>>{};
  final searchText = searchController.value.text.toLowerCase();
  final searchTextLength = searchText.length;
  for (var i in medicalSpecialties.entries) {
    String complexName = i.key.toLowerCase();
    String simpleName = i.value['name']!.toLowerCase();
    bool complexNameFound = false;
    for (int complexIndex = 0;
        complexIndex < complexName.length;
        complexIndex++) {
      if (searchTextLength > complexName.length - complexIndex) {
        break;
      }
      print(complexName.substring(
        complexIndex,
        complexIndex + searchTextLength,
      ));

      if (complexName.substring(
            complexIndex,
            complexIndex + searchTextLength,
          ) ==
          searchText) {
        print('complex name $complexName matches search');
        results[i.key] = i.value;
        complexNameFound = true;
        break;
      }
    }

    if (complexNameFound) continue;

    for (int simpleIndex = 0; simpleIndex < simpleName.length; simpleIndex++) {
      if (searchTextLength > simpleName.length - simpleIndex) {
        break;
      }
      print(simpleName.substring(simpleIndex, simpleIndex + searchTextLength));
      if (simpleName.substring(simpleIndex, simpleIndex + searchTextLength) ==
          searchText) {
        print('simple name $simpleName matches search');
        results[i.key] = i.value;
        break;
      }
    }
  }
  ref.read(specialtiesSearchResults.notifier).update((state) => results);
}

void searchForSpecialties1(
    WidgetRef ref, TextEditingController searchController) {
  final results = <String, Map<String, String>>{};
  final searchText = searchController.value.text.toLowerCase();
  final searchTextLength = searchText.length;
  for (var i in medicalSpecialties.entries) {
    String complexName = i.key.toLowerCase();
    String simpleName = i.value['name']!.toLowerCase();
    bool complexNameFound = false;
    for (int complexIndex = 0;
        complexIndex < complexName.length;
        complexIndex++) {
      if (searchTextLength > complexName.length - complexIndex) {
        break;
      }
      print(complexName.substring(
        complexIndex,
        complexIndex + searchTextLength,
      ));

      if (complexName.substring(
            complexIndex,
            complexIndex + searchTextLength,
          ) ==
          searchText) {
        print('complex name $complexName matches search');
        results[i.key] = i.value;
        complexNameFound = true;
        break;
      }
    }

    if (complexNameFound) continue;

    for (int simpleIndex = 0; simpleIndex < simpleName.length; simpleIndex++) {
      if (searchTextLength > simpleName.length - simpleIndex) {
        break;
      }
      print(simpleName.substring(simpleIndex, simpleIndex + searchTextLength));
      if (simpleName.substring(simpleIndex, simpleIndex + searchTextLength) ==
          searchText) {
        print('simple name $simpleName matches search');
        results[i.key] = i.value;
        break;
      }
    }
  }
  ref.read(specialtiesSearchResults.notifier).update((state) => results);
}
