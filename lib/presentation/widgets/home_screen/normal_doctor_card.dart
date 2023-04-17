import 'package:cached_network_image/cached_network_image.dart';
import 'package:doclink/core/providers/router_provider.dart';
import 'package:doclink/core/utilities/specialties_map.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/consts/app_typography.dart';
import '../../../data/data source/patient_remote_date_source.dart';
import '../../../domain/entities/doctor.dart';

class NormalDoctorCard extends ConsumerWidget {
  const NormalDoctorCard({
    Key? key,
    required this.doctor,
    required this.isFav,
    required this.colorScheme,
    this.additionalFunction,
    this.lastItem = false,
    this.screenRef,
  }) : super(key: key);

  final Doctor doctor;
  final bool isFav;
  final ColorScheme colorScheme;
  final void Function()? additionalFunction;
  final bool lastItem;
  final WidgetRef? screenRef;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        child: InkWell(
          onTap: () {
            ref
                .read(routerHandlerProvider.notifier)
                .enterNewScreen('doctor/${doctor.id}');
          },
          borderRadius: BorderRadius.circular(25),
          child: Ink(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: colorScheme.primaryContainer,
              boxShadow: const [
                BoxShadow(color: Colors.black54),
              ],
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: CachedNetworkImage(
                            imageUrl: doctor.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.05,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: AlignmentDirectional.centerStart,
                                  child: Text(
                                    'Dr. ${doctor.name}',
                                    style: AppTypography.bodySize(context),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  if (lastItem) {
                                    additionalFunction!();
                                    await Future.delayed(
                                      const Duration(
                                        milliseconds: 500,
                                      ),
                                    );
                                    screenRef!
                                        .read(
                                          patientRemoteDataSourceProvider
                                              .notifier,
                                        )
                                        .handleFavorite(
                                          int.parse(doctor.id),
                                        );
                                    return;
                                  }
                                  await ref
                                      .read(patientRemoteDataSourceProvider
                                          .notifier)
                                      .handleFavorite(
                                        int.parse(doctor.id),
                                      );
                                  if (additionalFunction != null) {
                                    additionalFunction!();
                                  }
                                },
                                icon: Icon(
                                  !isFav
                                      ? Icons.favorite_border
                                      : Icons.favorite,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 4,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              medicalSpecialties[doctor.speciality]!['name']!,
                              style: AppTypography.semiHeadlineSize(context),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              const FittedBox(
                                child: Icon(Icons.star),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  '${doctor.rating} (${doctor.reviews.length} Reviews)',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
