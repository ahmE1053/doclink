import 'package:doclink/core/consts/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/data source/doctor_remote_data_source.dart';
import '../../widgets/home_screen/doctor_info_widgets/doc_info_appbar.dart';
import '../../widgets/home_screen/doctor_info_widgets/doc_main_info.dart';

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
      body: ref.watch(doctorsNotifierProvider).when(
            data: (data) {
              final doctor =
                  data.where((doctorInfo) => doctorInfo.id == id).single;
              final doctorClinicPosition = LatLng(
                doctor.location.coordinates[0],
                doctor.location.coordinates[1],
              );
              final mq = MediaQuery.of(context).size;
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
                      SizedBox(height: mq.height * 0.1),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: mq.width * 0.05,
                              vertical: mq.height * 0.05),
                          child: ListView(
                            children: [
                              Text(
                                'Biography',
                                style: AppTypography.bodySize(
                                  context,
                                  colorScheme.primary,
                                ),
                              )
                            ],
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
