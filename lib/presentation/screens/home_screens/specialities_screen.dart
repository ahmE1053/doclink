import 'dart:developer';

import 'package:doclink/core/utilities/specialties_map.dart';
import 'package:doclink/presentation/widgets/authentication_handling_widgets/my_text_field_widget.dart';
import 'package:doclink/presentation/widgets/home_screen/specialty_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../core/providers/state_providers.dart';

class SpecialitiesScreen extends HookConsumerWidget {
  const SpecialitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextProvider = ref.read(specialtiesSearchTextField);
    final searchController = useTextEditingController(text: searchTextProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final mq = MediaQuery.of(context).size;
    final specialtiesEntries = ref.watch(specialtiesSearchResults);
    final formKey = useState(GlobalKey<FormState>());
    return WillPopScope(
      onWillPop: () async {
        ref.invalidate(specialtiesSearchTextField);
        ref.invalidate(specialtiesSearchResults);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Specialities'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              ref.invalidate(specialtiesSearchTextField);
              ref.invalidate(specialtiesSearchResults);
              context.pop();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: mq.height * 0.075,
                child: Form(
                  key: formKey.value,
                  child: MyTextField(
                    onChanged: (value) {
                      ref
                          .read(specialtiesSearchTextField.notifier)
                          .update((state) => value);
                    },
                    controller: searchController,
                    colorScheme: colorScheme,
                    label: 'Search',
                    validator: (value) {
                      if (value!.isEmpty || value.trim().isEmpty) {
                        return 'Text can\'t be empty';
                      }
                      if (value.length < 3) {
                        return 'Text can\'t be less than 3 characters';
                      }

                      return null;
                    },
                    inputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      if (!formKey.value.currentState!.validate()) return;
                      searchForSpecialties(ref, searchController);
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    suffix: specialtiesEntries.isEmpty
                        ? IconButton(
                            onPressed: () {
                              ref.invalidate(specialtiesSearchTextField);
                              searchController.text = '';
                              ref
                                  .read(specialtiesSearchResults.notifier)
                                  .update(
                                    (state) => medicalSpecialties,
                                  );
                            },
                            icon: const Icon(Icons.close),
                          )
                        : IconButton(
                            onPressed: () {
                              if (!formKey.value.currentState!.validate())
                                return;
                              searchForSpecialties(ref, searchController);
                              FocusManager.instance.primaryFocus!.unfocus();
                            },
                            icon: const Icon(
                              Icons.search,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: specialtiesEntries.isEmpty
                    ? Center(
                        child: SizedBox(
                          height: mq.height * 0.5,
                          width: mq.width * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Lottie.asset(
                                'assets/lottie/not_found.json',
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 8),
                              const FittedBox(
                                child: Text(
                                  'Your search didn\'t come up \nwith any results',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: specialtiesEntries.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          final specialtyMapEntry =
                              specialtiesEntries.entries.elementAt(index);
                          final specialty = Specialty(
                            specialtyMapEntry.key,
                            specialtyMapEntry.value['name']!,
                            specialtyMapEntry.value['imagePath']!,
                          );
                          return SpecialityCard(
                            specialty: specialty,
                            colorIndex: index,
                          );
                        },
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
