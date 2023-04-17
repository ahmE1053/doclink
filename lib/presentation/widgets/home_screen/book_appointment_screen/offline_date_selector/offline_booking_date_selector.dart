import 'package:doclink/presentation/widgets/home_screen/book_appointment_screen/offline_date_selector/clinic_hours_viewer.dart';
import 'package:doclink/presentation/widgets/home_screen/book_appointment_screen/offline_date_selector/offline_day_selector.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/providers/book_appointment_provider.dart';
import '../../../../../domain/entities/doctor.dart';
import '../online_date_selector/online_day_selector.dart';

class OfflineBookingDateSelector extends ConsumerWidget {
  const OfflineBookingDateSelector({
    Key? key,
    required this.mq,
    required this.doctor,
    required this.colorScheme,
  }) : super(key: key);
  final Size mq;
  final Doctor doctor;
  final ColorScheme colorScheme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: mq.height * 0.07,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemExtent: mq.width * 0.15,
            itemBuilder: (context, index) {
              final selectedDay = ref.watch(bookAppointmentProvider).day;
              final day =
                  DateTime.parse('2023-03-25').add(Duration(days: index));
              final dayInfoForBooking =
                  doctor.getDoctorAvailabilityForOfflineDay(day, selectedDay);
              return OfflineDaySelector(
                day: day,
                offlineDay: dayInfoForBooking.offlineAvailability,
                state: dayInfoForBooking.timeState,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        ClinicHoursViewer(colorScheme)
      ],
    );
  }
}
