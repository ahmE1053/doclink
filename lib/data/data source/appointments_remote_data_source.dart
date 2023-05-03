import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doclink/data/data%20source/patient_remote_date_source.dart';
import 'package:doclink/domain/entities/appointment.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppointmentRemoteDataSourceNotifier
    extends AsyncNotifier<List<Appointment>> {
  @override
  Future<List<Appointment>> build() async {
    final appointmentIdList =
        ref.read(patientRemoteDataSourceProvider).value!.appointments;
    final appointmentList = <Appointment>[];
    for (var id in appointmentIdList) {
      final appointmentMap = ((await FirebaseFirestore.instance
              .collection('appointments')
              .doc(id)
              .get())
          .data()!);
      final appointment = Appointment.fromJson(appointmentMap);
      appointmentList.add(appointment);
    }
    return appointmentList;
  }

  Future<void> cancelAppointment(String id) async {
    final appointment =
        state.value!.firstWhere((element) => element.id == id).copyWith(
              appointmentState: AppointmentState.absent,
            );
    await FirebaseFirestore.instance.collection('appointments').doc(id).set(
          appointment.toJson(),
        );
    List<Appointment> appointments = [];
    for (Appointment i in state.value!) {
      if (i.id == id) {
        appointments.add(appointment);
        continue;
      }
      appointments.add(i);
    }
    state = AsyncValue.data(appointments);
  }

  Future<void> changeTime(
      String id, String day, String time, Duration duration) async {
    final appointment =
        state.value!.firstWhere((element) => element.id == id).copyWith(
              day: day,
              time: time,
              timeLeft: duration,
            );
    await FirebaseFirestore.instance.collection('appointments').doc(id).set(
          appointment.toJson(),
        );
    List<Appointment> appointments = [];
    for (Appointment i in state.value!) {
      if (i.id == id) {
        appointments.add(appointment);
        continue;
      }
      appointments.add(i);
    }
    state = AsyncValue.data(appointments);
  }

  Future<void> changeReviewOrCancellationReasonState(String id,
      {bool? didLeaveReview, bool? didLeaveCancellationReason}) async {
    var appointment = state.value!.firstWhere((element) => element.id == id);
    appointment = appointment.copyWith(
      didLeaveReview: didLeaveReview ?? appointment.didLeaveReview,
      didLeaveCancellationReason:
          didLeaveCancellationReason ?? appointment.didLeaveCancellationReason,
    );
    await FirebaseFirestore.instance.collection('appointments').doc(id).set(
          appointment.toJson(),
        );
    List<Appointment> appointments = [];
    for (Appointment i in state.value!) {
      if (i.id == id) {
        appointments.add(appointment);
        continue;
      }
      appointments.add(i);
    }
    state = AsyncValue.data(appointments);
  }
}

final appointmentNotifierProvider = AsyncNotifierProvider<
    AppointmentRemoteDataSourceNotifier, List<Appointment>>(
  () => AppointmentRemoteDataSourceNotifier(),
);
