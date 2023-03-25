import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../core/providers/state_providers.dart';
import '../../../core/utilities/search_functions.dart';
import '../../widgets/home_screen/specialty_card.dart';
import '../../widgets/search_text_field.dart';

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
                child: SearchTextField(
                  controller: searchController,
                  colorScheme: colorScheme,
                  formKey: formKey.value,
                  provider: specialtiesSearchTextField,
                  ref: ref,
                  searchFunction: () {
                    searchForSpecialties(ref, searchController);
                  },
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
