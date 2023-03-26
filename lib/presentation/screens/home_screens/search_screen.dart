import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/providers/state_providers.dart';
import '../../../core/utilities/search_functions.dart';
import '../../../data/data source/patient_remote_date_source.dart';
import '../../widgets/home_screen/normal_doctor_card.dart';
import '../../widgets/home_screen/not_found.dart';
import '../../widgets/search_text_field.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    searchController.text = ref.read(homeSearchTextField);

    final results = ref.watch(doctorSearchResults);
    final patient = ref.watch(patientRemoteDataSourceProvider).value!;

    final mq = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async {
          ref.invalidate(homeSearchTextField);
          ref.invalidate(doctorSearchResults);
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Search Results',
            ),
            leading: IconButton(
              onPressed: () {
                ref.invalidate(homeSearchTextField);
                ref.invalidate(doctorSearchResults);
                context.pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SearchTextField(
                  controller: searchController,
                  colorScheme: colorScheme,
                  searchFunction: () {
                    searchForDoctors(ref, searchController);
                  },
                  ref: ref,
                  formKey: formKey,
                  provider: homeSearchTextField,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: results.isEmpty
                      ? NotFound(mq: mq)
                      : ListView.builder(
                          itemCount: results.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final doctor = results[index];
                            final isFav = patient.favoriteDoctors.contains(
                              int.parse(doctor.id),
                            );
                            return NormalDoctorCard(
                              doctor: doctor,
                              isFav: isFav,
                              colorScheme: colorScheme,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
