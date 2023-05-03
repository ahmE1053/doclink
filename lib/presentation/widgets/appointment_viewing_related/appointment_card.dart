import 'package:cached_network_image/cached_network_image.dart';
import 'package:doclink/core/consts/app_typography.dart';
import 'package:doclink/core/utilities/appointment_card_utilities.dart';
import 'package:doclink/core/utilities/duration_converter.dart';
import 'package:doclink/data/data%20source/appointments_remote_data_source.dart';
import 'package:doclink/data/data%20source/doctor_remote_data_source.dart';
import 'package:doclink/domain/entities/appointment.dart';
import 'package:doclink/presentation/widgets/appointment_viewing_related/appointment_card_buttons/change_time_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/doctor.dart';
import 'appointment_card_buttons/cancel_appointment_button.dart';

class OnlineAppointmentCard extends ConsumerWidget {
  const OnlineAppointmentCard({Key? key, required this.appointment})
      : super(key: key);
  final Appointment appointment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final mq = MediaQuery.of(context).size;
    final appointmentInfo =
        AppointmentCardUtilities(appointment.appointmentState);
    final borderColor =
        appointmentInfo.appointmentBorderCardColor(colorScheme.primary);

    final doctor = ref
        .read(doctorsNotifierProvider.notifier)
        .getDoctorById(appointment.doctorId);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: borderColor,
          ),
        ),
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Builder(
              builder: (context) {
                String text =
                    appointmentInfo.appointmentCardUpperText(appointment.day);
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                    color: borderColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      text,
                      style: AppTypography.semiBodySize(
                        context,
                        borderColor != colorScheme.primary
                            ? Colors.white
                            : colorScheme.onPrimary,
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: mq.height * 0.1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          width: mq.width * 0.2,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: doctor.imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              'Dr. ${doctor.name}',
                              style: AppTypography.bodySize(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    appointmentInfo.appointmentStateText(
                      appointment.time,
                      appointment.day,
                    ),
                    style: AppTypography.semiBodySize(context),
                  ),
                  const SizedBox(height: 8),
                  if (!(appointment.appointmentState !=
                      AppointmentState.coming))
                    Text(
                      'Time left: ${formatDuration(appointment.timeLeft)}',
                      style: AppTypography.smallSize(context),
                    ),
                  const SizedBox(height: 8),
                  Builder(builder: (context) {
                    if (appointment.didLeaveCancellationReason ||
                        appointment.didLeaveReview) {
                      return Container();
                    }
                    return appointmentInfo.appointmentCardButton(
                      appointment.id,
                      doctor,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentComingButtons extends ConsumerWidget {
  const AppointmentComingButtons({
    super.key,
    required this.appointmentId,
    required this.doctor,
  });
  final String appointmentId;
  final Doctor doctor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: CancelAppointmentButton(id: appointmentId),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: ChangeTimeButton(doctor: doctor, appointmentId: appointmentId),
        ),
      ],
    );
  }
}
