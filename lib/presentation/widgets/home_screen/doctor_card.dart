import 'package:cached_network_image/cached_network_image.dart';
import 'package:doclink/core/consts/app_typography.dart';
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
        final doctorsList = data.take(6).toList();
        return GridView.builder(
          itemCount: doctorsList.length,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: mq.width * 0.3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final doctor = doctorsList[index];
            return Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xfff5e9f5),
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: CachedNetworkImage(
                            imageUrl: doctor.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: FittedBox(
                    child: RichText(
                      textAlign: TextAlign.center,
                      textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: true,
                          leadingDistribution: TextLeadingDistribution.even),
                      text: TextSpan(
                        text: doctor.name,
                        style: AppTypography.bodySize(context),
                        children: [
                          TextSpan(
                            text: '\n${doctor.speciality}',
                            style: AppTypography.smallSize(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
