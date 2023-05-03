import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/consts/app_typography.dart';
import '../../../../core/providers/book_appointment_provider.dart';
import '../../../../core/utilities/appointment_error_state.dart';
import '../../../../domain/entities/doctor.dart';
import '../../home_screen_related/book_appointment_related/online_date_selector/online_booking_date_selector.dart';

class ChangeTimeButton extends ConsumerWidget {
  const ChangeTimeButton({
    Key? key,
    required this.doctor,
    required this.appointmentId,
  }) : super(key: key);
  final Doctor doctor;
  final String appointmentId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref.read(bookAppointmentProvider.notifier).reset();
              });
              return ScaffoldMessenger(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: WillPopScope(
                    onWillPop: () async => false,
                    child: Dialog(
                      child: OnlineTimeChangerWidget(
                          doctor: doctor, appointmentId: appointmentId),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Text('Change time'));
  }
}

class OnlineTimeChangerWidget extends HookConsumerWidget {
  const OnlineTimeChangerWidget({
    Key? key,
    required this.doctor,
    required this.appointmentId,
  }) : super(key: key);
  final Doctor doctor;
  final String appointmentId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final mq = MediaQuery.of(context).size;
    final errorState = useState(const AppointmentErrorState());
    final loading = useState(false);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Day',
                style: AppTypography.bodySize(context, colorScheme.primary),
              ),
              IconButton(
                onPressed: () {
                  ref.read(bookAppointmentProvider.notifier).reset();
                  Navigator.pop(context);
                },
                color: colorScheme.primary,
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 16),
          OnlineBookingDateSelector(
            errorState: errorState.value,
            colorScheme: colorScheme,
            doctor: doctor,
            mq: mq,
          ),
          const SizedBox(height: 16),
          Builder(
            builder: (context) {
              if (loading.value) {
                return SpinKitChasingDots(
                  color: colorScheme.primary,
                );
              }
              return ElevatedButton(
                onPressed: () async {
                  loading.value = true;
                  final result = await ref
                      .read(bookAppointmentProvider.notifier)
                      .changeAlreadyBookedTime(
                          context, errorState, appointmentId);
                  if (context.mounted && result) {
                    ref.read(bookAppointmentProvider.notifier).reset();
                    Navigator.pop(context);
                    return;
                  }
                  loading.value = false;
                },
                child: const Text('Change'),
              );
            },
          ),
        ],
      ),
    );
  }
}
