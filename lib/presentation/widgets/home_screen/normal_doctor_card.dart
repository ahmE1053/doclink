import 'package:cached_network_image/cached_network_image.dart';
import 'package:doclink/core/consts/app_typography.dart';
import 'package:doclink/data/data%20source/patient_remote_date_source.dart';
import 'package:doclink/domain/entities/doctor.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NormalDoctorCard extends ConsumerWidget {
  const NormalDoctorCard(
      {Key? key,
      required this.doctor,
      required this.isFav,
      required this.colorScheme})
      : super(key: key);
  final Doctor doctor;
  final bool isFav;
  final ColorScheme colorScheme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 8),
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
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            'Dr. ${doctor.name}',
                            style: AppTypography.bodySize(context),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ref
                                .read(patientRemoteDataSourceProvider.notifier)
                                .handleFavorite(
                                  int.parse(doctor.id),
                                );
                          },
                          icon: Icon(
                            !isFav ? Icons.favorite_border : Icons.favorite,
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
                        doctor.speciality,
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
    );
  }
}
