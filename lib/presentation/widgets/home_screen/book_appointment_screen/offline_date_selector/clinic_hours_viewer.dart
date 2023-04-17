import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/consts/app_typography.dart';
import '../../../../../core/providers/book_appointment_provider.dart';

class ClinicHoursViewer extends ConsumerWidget {
  const ClinicHoursViewer(this.colorScheme, {Key? key}) : super(key: key);
  final ColorScheme colorScheme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clinicHours = ref.watch(selectedOfflineDayTimes);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'Clinic Hours',
            style: AppTypography.bodySize(context, colorScheme.surfaceTint),
          ),
        ),
        const SizedBox(height: 16),
        Builder(builder: (context) {
          if (clinicHours == null) {
            return FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Please select a day.',
                style: AppTypography.semiBodySize(context),
              ),
            );
          }
          final timeFrom =
              DateTime.parse('2000-01-02 ${clinicHours.timeFrom}:00');
          final timeTo = DateTime.parse('2000-01-02 ${clinicHours.timeTo}:00');
          final format = DateFormat.jm();
          return FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.center,
            child: Text(
              '${format.format(timeFrom)} - ${format.format(timeTo)}',
              style: AppTypography.headlineSize(
                context,
                colorScheme.primary,
              ),
            ),
          );
        }),
      ],
    );
  }
}
