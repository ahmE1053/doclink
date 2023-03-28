import 'package:cached_network_image/cached_network_image.dart';
import 'package:doclink/core/consts/app_typography.dart';
import 'package:doclink/core/providers/router_provider.dart';
import 'package:doclink/core/utilities/specialties_map.dart';
import 'package:doclink/data/data%20source/doctor_remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeDoctorCard extends ConsumerWidget {
  const HomeDoctorCard({Key? key, required this.mq}) : super(key: key);
  final Size mq;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctors = ref.watch(doctorsNotifierProvider);
    return doctors.when(
      data: (data) {
        final sortedList = data
          ..sort(
            (a, b) => b.rating.compareTo(a.rating),
          );

        final doctorsList = sortedList.take(6).toList();
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: doctorsList.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: mq.width * 0.35,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final doctor = doctorsList[index];
            return Material(
              child: InkWell(
                onTap: () {
                  ref
                      .read(routerHandlerProvider.notifier)
                      .enterNewScreen('doctor/${doctor.id}');
                },
                borderRadius: BorderRadius.circular(25),
                child: Ink(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xfff5e9f5),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Hero(
                            tag: doctor.id,
                            child: CachedNetworkImage(
                              imageUrl: doctor.imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            FittedBox(
                              alignment: AlignmentDirectional.centerStart,
                              fit: BoxFit.scaleDown,
                              child: Text(
                                doctor.name,
                                style: AppTypography.bodySize(context),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Text(
                                      medicalSpecialties[doctor.speciality]![
                                          'name']!,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTypography.smallSize(context),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    '${doctor.rating} (${doctor.reviews.length})',
                                    style: AppTypography.smallSize(context),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) => const Center(
        child: Text('An error occurred. Please try again later'),
      ),
      loading: () => Center(
        child: SpinKitFadingGrid(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
