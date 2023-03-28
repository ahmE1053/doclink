import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doclink/core/utilities/search_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../core/consts/app_typography.dart';
import '../../../core/providers/router_provider.dart';
import '../../../core/providers/state_providers.dart';
import '../../../core/utilities/specialties_map.dart';
import '../../../data/data source/doctor_remote_data_source.dart';
import '../../../domain/entities/doctor.dart';
import '../../widgets/home_screen/home_doctor_card.dart';
import '../../widgets/home_screen/specialty_card.dart';
import '../../widgets/home_screen/top_doctors.dart';
import '../../widgets/search_text_field.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context).size;
    final searchTextController = useTextEditingController();
    final colorScheme = Theme.of(context).colorScheme;

    final formKey = useMemoized(() => GlobalKey<FormState>());
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: mq.height * 0.1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // FittedBox(
                    //   child: Lottie.asset(
                    //     'assets/lottie/heart.json',
                    //     fit: BoxFit.fill,
                    //   ),
                    // ),
                    const SizedBox(width: 10),
                    Align(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.center,
                        child: Text(
                          'DocLink',
                          style: AppTypography.semiHeadlineSize(context),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FittedBox(
                            child: IconButton(
                              onPressed: () async {},
                              icon: const Icon(Icons.notifications),
                            ),
                          ),
                          FittedBox(
                            child: IconButton(
                              onPressed: () {
                                ref
                                    .read(routerHandlerProvider.notifier)
                                    .enterNewScreen('favorites');
                              },
                              icon: const Icon(Icons.favorite),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 16),
                    SizedBox(
                      height: mq.height * 0.075,
                      child: Consumer(
                        builder: (context, ref, child) {
                          if (!GoRouter.of(context)
                              .location
                              .endsWith('search')) {
                            final textFieldValue =
                                ref.read(homeSearchTextField);
                            searchTextController.text = textFieldValue;
                          }
                          return SearchTextField(
                            enabled: ref.watch(doctorsNotifierProvider).value !=
                                null,
                            controller: searchTextController,
                            colorScheme: colorScheme,
                            provider: homeSearchTextField,
                            formKey: formKey,
                            searchFunction: () {
                              ref
                                  .read(routerHandlerProvider.notifier)
                                  .enterNewScreen('search');
                              searchForDoctors(ref, searchTextController);
                              searchTextController.text = '';
                            },
                            ref: ref,
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Doctor Speciality',
                          style: AppTypography.semiHeadlineSize(context),
                        ),
                        TextButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus!.unfocus();

                            ref
                                .read(routerHandlerProvider.notifier)
                                .enterNewScreen('specialties');
                          },
                          child: const Text('See all'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: mq.height * 0.3,
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          mainAxisExtent: mq.width * 0.3,
                        ),
                        itemBuilder: (context, index) {
                          final specialityEntry =
                              medicalSpecialties.entries.elementAt(index);
                          final specialty = Specialty(
                              specialityEntry.key,
                              specialityEntry.value['name']!,
                              specialityEntry.value['imagePath']!);
                          return SpecialityCard(
                            specialty: specialty,
                            colorIndex: index,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Doctors',
                          style: AppTypography.semiHeadlineSize(context),
                        ),
                        TextButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus!.unfocus();
                          },
                          child: const Text('See all'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: mq.height * 0.4,
                      child: HomeDoctorCard(mq: mq),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
