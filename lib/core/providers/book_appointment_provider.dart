import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doclink/core/utilities/show_snack_bar.dart';
import 'package:doclink/data/data%20source/appointments_remote_data_source.dart';
import 'package:doclink/data/data%20source/patient_remote_date_source.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/appointment.dart';
import '../../domain/entities/doctor.dart';
import '../utilities/appointment_error_state.dart';

class BookAppointmentNotifier extends Notifier<Appointment> {
  @override
  Appointment build() {
    return const Appointment(
      id: 'id',
      day: '',
      time: '',
      forAnotherPatient: false,
      didLeaveCancellationReason: false,
      didLeaveReview: false,
      phoneNumber: '',
      appointmentState: AppointmentState.coming,
      appointmentLocation: AppointmentLocation.atClinic,
      additionalInfo: '',
      doctorId: '',
      timeLeft: Duration(),
    );
  }

  void copyWith(Appointment appointment) {
    state = appointment;
  }

  void reset() {
    ref.invalidateSelf();
    ref.read(selectedOnlineDayTimes.notifier).update((state) => []);
    ref.read(selectedOfflineDayTimes.notifier).update((state) => null);
  }

  void changeDay(String day) {
    state = state.copyWith(day: day);
  }

  void changeTime(String time) {
    state = state.copyWith(time: time);
  }

  void changeDoctor(String id) {
    state = state.copyWith(doctorId: id);
  }

  Future<bool> registerAppointment(
    BuildContext context,
    ValueNotifier<AppointmentErrorState> errorState,
    String phoneNumber,
    String additionalInfo,
    String doctorId,
  ) async {
    //To not trigger the timer again in case he pressed the button again before the 3 second timer.
    if (errorState.value.day || errorState.value.time) return false;
    //if the user didn't select a day, trigger an error state that changes all the days borders to red
    //and shows a snack bar
    if (state.day == '') {
      errorState.value = const AppointmentErrorState(day: true);
      showSnackBar(context, 'Please select a day');
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          errorState.value = const AppointmentErrorState();
        },
      );
      return false;
    }

    //if the user didn't select a time, trigger an error state that changes all the times borders to red
    //and shows a snack bar.
    if (state.time == '') {
      errorState.value = const AppointmentErrorState(time: true);
      showSnackBar(context, 'Please select a time');
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          errorState.value = const AppointmentErrorState();
        },
      );
      return false;
    }
    //generate an id for the appointment
    final id = const Uuid().v4();

    state = state.copyWith(
      additionalInfo: additionalInfo,
      phoneNumber: phoneNumber,
      doctorId: doctorId,
      id: id,
      timeLeft: DateTime.parse('${state.day} ${state.time}')
          .add(const Duration(days: 35, hours: 5))
          .difference(
            DateTime.now(),
          ),
    );

    await FirebaseFirestore.instance.collection('appointments').doc(id).set(
          state.toJson(),
        );

    final patientRef = ref.read(patientRemoteDataSourceProvider).value!;
    final appointments = List<String>.from(patientRef.appointments)..add(id);
    ref.read(patientRemoteDataSourceProvider.notifier).copyWith(
          patientRef.copyWith(appointments: appointments),
        );

    await FirebaseFirestore.instance
        .collection('patients')
        .doc(patientRef.id)
        .update(
      {
        'appointments': appointments,
      },
    );
    ref.invalidate(appointmentNotifierProvider);
    return true;
  }

  Future<bool> changeAlreadyBookedTime(
    BuildContext context,
    ValueNotifier<AppointmentErrorState> errorState,
    String appointmentId,
  ) async {
    if (errorState.value.day || errorState.value.time) return false;

    if (state.day == '') {
      errorState.value = const AppointmentErrorState(day: true);
      showSnackBar(context, 'Please select a day');
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          errorState.value = const AppointmentErrorState();
        },
      );
      return false;
    }

    //if the user didn't select a time, trigger an error state that changes all the times borders to red
    //and shows a snack bar.
    if (state.time == '') {
      errorState.value = const AppointmentErrorState(time: true);
      showSnackBar(context, 'Please select a time');
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          errorState.value = const AppointmentErrorState();
        },
      );
      return false;
    }
    final duration = DateTime.parse('${state.day} ${state.time}')
        .add(const Duration(days: 35, hours: 5))
        .difference(
          DateTime.now(),
        );
    await ref.read(appointmentNotifierProvider.notifier).changeTime(
          appointmentId,
          state.day,
          state.time,
          duration,
        );

    return true;
  }
}

final bookAppointmentProvider =
    NotifierProvider<BookAppointmentNotifier, Appointment>(
  () => BookAppointmentNotifier(),
);

final selectedOnlineDayTimes = StateProvider<List<TimeInDayOnline>>(
  (ref) => [],
);

final selectedOfflineDayTimes =
    StateProvider<OfflineAvailability?>((ref) => null);
