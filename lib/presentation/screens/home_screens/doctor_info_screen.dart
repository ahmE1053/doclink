import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/consts/app_typography.dart';
import '../../../data/data source/doctor_remote_data_source.dart';
import '../../widgets/home_screen/doctor_info_widgets/doc_info_appbar.dart';
import '../../widgets/home_screen/doctor_info_widgets/doc_main_info.dart';
import '../../widgets/home_screen/doctor_info_widgets/review_card.dart';
import '../../widgets/home_screen/google_map_widget.dart';

class DoctorInfoScreen extends HookConsumerWidget {
  const DoctorInfoScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoogleMapController;
    final mapController = useState<GoogleMapController?>(null);
    final mq = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: const Color(0xfff6f6fa),
      bottomNavigationBar: SizedBox(
        height: mq.height * 0.12,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Consultation Price',
                        style: AppTypography.semiBodySize(
                          context,
                          colorScheme.outline,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '\$ 52',
                        style: AppTypography.bodySize(
                          context,
                          colorScheme.outline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const FittedBox(
                    child: Text('Book Appointment'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ref.watch(doctorsNotifierProvider).when(
            data: (data) {
              final doctor =
                  data.where((doctorInfo) => doctorInfo.id == id).single;
              final doctorClinicPosition = LatLng(
                doctor.location.coordinates[0],
                doctor.location.coordinates[1],
              );
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: mq.width * 0.05,
                    horizontal: mq.width * 0.07,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DocInfoAppBar(
                        doctor: doctor,
                        colorScheme: colorScheme,
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        height: mq.height * 0.2,
                        child: DocMainInfo(
                            doctor: doctor, colorScheme: colorScheme),
                      ),
                      SizedBox(height: mq.height * 0.04),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.only(
                            top: mq.height * 0.04,
                            bottom: mq.height * 0.02,
                            left: mq.width * 0.05,
                            right: mq.width * 0.05,
                          ),
                          child: LayoutBuilder(
                            builder: (context, size) {
                              return ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  Text(
                                    'Biography',
                                    style: AppTypography.bodySize(
                                      context,
                                      colorScheme.surfaceTint,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: mq.height * 0.03,
                                      maxHeight: mq.height * 0.1,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Text(
                                        doctor.aboutDoctor,
                                        style: AppTypography.semiBodySize(
                                          context,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Location',
                                    style: AppTypography.bodySize(
                                      context,
                                      colorScheme.surfaceTint,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    height: mq.height * 0.15,
                                    child: MyGoogleMapWidget(
                                      doctorClinicPosition:
                                          doctorClinicPosition,
                                      mapController: mapController,
                                      doctor: doctor,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Reviews',
                                    style: AppTypography.bodySize(
                                      context,
                                      colorScheme.surfaceTint,
                                    ),
                                  ),
                                  ...doctor.reviews.map(
                                    (e) => ReviewCard(
                                      review: e,
                                      rating: doctor.rating,
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (error, stackTrace) => const Center(
              child: Text('An error occurred, please try again later'),
            ),
            loading: () => Center(
              child: SpinKitFadingGrid(),
            ),
          ),
    );
  }
}

// Center(
//   // child: SizedBox(
//   //   height: mq.height * 0.2,
//   //   width: mq.width * 0.8,
//   //   child: MyGooleMapWidget(
//   //     doctorClinicPosition: doctorClinicPosition,
//   //     mapController: mapController,
//   //     doctor: doctor,
//   //   ),
//   // ),
//   );
