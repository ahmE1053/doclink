import 'package:riverpod/riverpod.dart';

import '../../domain/entities/appointment.dart';
import '../../domain/entities/doctor.dart';

class BookAppointmentNotifier extends Notifier<Appointment> {
  @override
  Appointment build() {
    return const Appointment(
      id: 'id',
      day: '',
      time: '',
      forAnotherPatient: false,
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
    state = state.copyWith(day: '', time: '');
  }

  void changeLocation() {}

  void changeDay(String day) {
    state = state.copyWith(day: day);
  }

  void changeTime(String time) {
    state = state.copyWith(time: time);
  }

  void changeDoctor(String id) {
    state = state.copyWith(doctorId: id);
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
