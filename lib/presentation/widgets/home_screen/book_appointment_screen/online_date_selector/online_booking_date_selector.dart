import 'package:doclink/presentation/widgets/home_screen/book_appointment_screen/online_date_selector/time_selector_list.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/consts/app_typography.dart';
import '../../../../../core/providers/book_appointment_provider.dart';
import '../../../../../domain/entities/doctor.dart';
import 'online_day_selector.dart';

class OnlineBookingDateSelector extends ConsumerWidget {
  const OnlineBookingDateSelector({
    super.key,
    required this.mq,
    required this.doctor,
    required this.colorScheme,
  });

  final Size mq;
  final Doctor doctor;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  doctor.getDoctorAvailabilityForOnlineDay(day, selectedDay);
              return OnlineDaySelector(
                day: day,
                onlineDay: dayInfoForBooking.onlineAvailability,
                state: dayInfoForBooking.timeState,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Time',
          style: AppTypography.bodySize(
            context,
            colorScheme.surfaceTint,
          ),
        ),
        const SizedBox(height: 16),
        const TimeSelectorList(),
      ],
    );
  }
}
