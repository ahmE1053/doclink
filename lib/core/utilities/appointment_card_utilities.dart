import 'package:flutter/material.dart';

import '../../domain/entities/appointment.dart';
import '../../domain/entities/doctor.dart';
import '../../presentation/widgets/appointment_viewing_related/appointment_card.dart';
import '../../presentation/widgets/appointment_viewing_related/appointment_card_buttons/cancellation_reason_button.dart';
import '../../presentation/widgets/appointment_viewing_related/appointment_card_buttons/leave_review_button.dart';

class AppointmentCardUtilities {
  final AppointmentState appointmentState;
  const AppointmentCardUtilities(this.appointmentState);

  Color appointmentBorderCardColor(Color color) {
    final colorMap = {
      AppointmentState.done: Colors.green,
      AppointmentState.absent: Colors.red,
      AppointmentState.coming: color,
    };
    return colorMap[appointmentState]!;
  }

  String appointmentCardUpperText(String date) {
    final stringMap = {
      AppointmentState.done: 'The appointment is done',
      AppointmentState.absent: 'The appointment was cancelled',
      AppointmentState.coming: 'The appointment is Scheduled to be in $date',
    };
    return stringMap[appointmentState]!;
  }

  String appointmentStateText(String time, String day) {
    final stringMap = {
      AppointmentState.coming:
          'Please Expect a call from the doctor at around $time at $day',
      AppointmentState.done:
          'The appointment was attended successfully at $day',
      AppointmentState.absent: 'You didn\'t attend this appointment',
    };
    return stringMap[appointmentState]!;
  }

  Widget appointmentCardButton(String appointmentId, Doctor doctor) {
    final widgetMap = {
      AppointmentState.coming: AppointmentComingButtons(
        appointmentId: appointmentId,
        doctor: doctor,
      ),
      AppointmentState.done: LeaveReviewButton(
        doctor: doctor,
        appointmentId: appointmentId,
      ),
      AppointmentState.absent: const CancellationReason(),
    };
    return widgetMap[appointmentState]!;
  }
}
