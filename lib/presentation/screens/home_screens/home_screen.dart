import 'package:doclink/core/providers/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../core/consts/app_typography.dart';
import '../../../core/providers/state_providers.dart';
import '../../../core/utilities/specialties_map.dart';
import '../../widgets/authentication_handling_widgets/my_text_field_widget.dart';
import '../../widgets/home_screen/doctor_card.dart';
import '../../widgets/home_screen/specialty_card.dart';
import '../../widgets/home_screen/top_doctors.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context).size;
    final searchTextController = useTextEditingController(
      text: ref.read(homeSearchTextField),
    );
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: mq.height * 0.1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FittedBox(
                    child: Lottie.asset(
                      'assets/lottie/heart.json',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(width: 10),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    child: Text(
                      'DocLink',
                      style: AppTypography.semiHeadlineSize(context),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FittedBox(
                          child: IconButton(
                            onPressed: () async {
                              await send();
                            },
                            icon: const Icon(Icons.notifications),
                          ),
                        ),
                        FittedBox(
                          child: IconButton(
                            onPressed: () {},
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
                        final textFieldValue =
                            ref.read(homeSearchTextField.notifier);
                        return MyTextField(
                          controller: searchTextController,
                          colorScheme: colorScheme,
                          validator: null,
                          label: 'Search',
                          onChanged: (value) {
                            textFieldValue.update((state) => value);
                          },
                          suffix: const Icon(
                            Icons.search,
                          ),
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
                      itemCount: medicalSpecialties.length,
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
                        onPressed: () {},
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
    );
  }
}
