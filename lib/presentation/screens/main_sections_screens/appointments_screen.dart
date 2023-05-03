import 'package:doclink/data/data%20source/appointments_remote_data_source.dart';
import 'package:doclink/presentation/widgets/home_screen_related/not_found.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../widgets/appointment_viewing_related/appointment_card.dart';

class AppointmentsScreen extends ConsumerWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Appointments Screen',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ref.watch(appointmentNotifierProvider).when(
              data: (data) {
                if (data.isEmpty) {
                  return NotFound(
                    mq: mq,
                    text: 'You don\'t have any appointments yet.',
                  );
                }
                return ListView.builder(
                  itemCount: data.length,
                  // itemExtent: mq.height * 0.2,
                  itemBuilder: (context, index) {
                    return OnlineAppointmentCard(
                      appointment: data[index],
                    );
                  },
                );
              },
              error: (_, __) {
                print(_);
                print(__);
                return const Center(
                  child: Text('An error Occurred. Weird'),
                );
              },
              loading: () => Center(
                child: SpinKitChasingDots(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
      ),
    );
  }
}
