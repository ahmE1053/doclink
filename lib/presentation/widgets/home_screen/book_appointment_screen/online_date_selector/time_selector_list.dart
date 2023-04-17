import 'package:doclink/core/consts/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/providers/book_appointment_provider.dart';
import '../../../../screens/home_screens/book_appointment.dart';
import 'time_selector.dart';

class TimeSelectorList extends HookConsumerWidget {
  const TimeSelectorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTime = ref.watch(bookAppointmentProvider).time;
    final mq = MediaQuery.of(context).size;
    final list = ref.watch(selectedOnlineDayTimes);
    return SizedBox(
      height: mq.height * 0.1,
      child: list.isEmpty
          ? FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Please select a day.',
                style: AppTypography.semiBodySize(context),
              ),
            )
          : GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: mq.width * 0.3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final dayTime = list[index];
                final available = dayTime.available;
                return TimeSelector(
                  state: available
                      ? selectedTime == dayTime.timeOfDay
                          ? TimeStates.selected
                          : TimeStates.available
                      : TimeStates.disabled,
                  time: DateTime.parse('2000-01-02 ${dayTime.timeOfDay}:00'),
                );
              },
            ),
    );
  }
}
