import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/data source/doctor_remote_data_source.dart';
import '../../../data/data source/patient_remote_date_source.dart';
import '../../widgets/home_screen/normal_doctor_card.dart';
import '../../widgets/home_screen/not_found.dart';
import '../../widgets/home_screen/specialty_card.dart';

class SpecialtyScreen extends ConsumerWidget {
  const SpecialtyScreen({Key? key, required this.specialtyName})
      : super(key: key);
  final String specialtyName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final specialty = Specialty.fromName(specialtyName);
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(specialty.simpleName),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ref.watch(doctorsNotifierProvider).when(
              data: (data) {
                final doctorsList = data
                    .where((doctor) => doctor.speciality == specialty.name)
                    .toList();
                return doctorsList.isEmpty
                    ? NotFound(
                        mq: mq,
                        text: 'No doctors in here yet\n Mocking fucking sucks',
                      )
                    : ListView.builder(
                        itemCount: doctorsList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final doctor = doctorsList[index];
                          return NormalDoctorCard(
                            doctor: doctor,
                            isFav: ref
                                .watch(patientRemoteDataSourceProvider)
                                .value!
                                .favoriteDoctors
                                .contains(
                                  int.parse(doctor.id),
                                ),
                            colorScheme: Theme.of(context).colorScheme,
                          );
                        },
                      );
              },
              error: (error, stackTrace) => const Center(
                child: Text('An error occurred, please try again later'),
              ),
              loading: () => Center(
                child: SpinKitFadingGrid(),
              ),
            ),
      ),
    );
  }
}
